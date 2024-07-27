v 4.9

b main
:encode
:comp
s/^/#/
:zip; s/^(#+)([^#])\2/\1#\2/; t zip
s/^#+[^#]/&\n/
H; g; x
s/\n[^\n]+$//
x; s/.*\n//
/^$/ ! b comp
g
:loop
s/^\n//
s/^[^\n]+\n//
x
s/^\n//
s/\n.*//
:h2n
s/##########/@/g
s/@([0-9]*)$/@0\1/
s/#########/9/
s/########/8/
s/#######/7/
s/######/6/
s/#####/5/
s/####/4/
s/###/3/
s/##/2/
s/#/1/
s/@/#/g
t h2n
x; G; h
/#/ b loop
s/^/\n/
s/\n1([^0-9])/\n\1/g
s/\n//g
q

:decode
s/[0-9]/@&/g
s/0//g
s/1/#/g
s/2/##/g
s/3/###/g
s/4/####/g
s/5/#####/g
s/6/######/g
s/7/#######/g
s/8/########/g
s/9/#########/g
:tens; s/#@/@##########/g; t tens
s/@//g
s/#([^#])/\1/g
:unc; s/#([^#])/\1\1/; t unc

:main
/""$/ { z; q }

/"property": "encode", "string": "/ { s///; s/"$//; b encode }
/"property": "decode", "string": "/ { s///; s/"$//; b decode }
