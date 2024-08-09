v 4.9

b main

:compute
:n2h
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
/^\a/ b reth

:multiply;
s/\a(#+)\*(#+)#/\1\a\1\*\2/
t multiply
s/\*#$//
s/\a//
s/^/\a/

:h2n
s/##########/@/g
s/@([0-9]*)([^0-9#@]|$)/@0\1\2/g
s/#########/9/g
s/########/8/g
s/#######/7/g
s/######/6/g
s/#####/5/g
s/####/4/g
s/###/3/g
s/##/2/g
s/#/1/g
s/@/#/g
t h2n
/\a/ b result
b

:main
/^\{\s*"property":\s*"primes",\s* "limit":\s*([0-9]+)\s*\}$/ ! Q
s//\1/

/^[01]$/{z;q}
/^2$/q

:loop
G; h
s/\n.*//
:decr
s/([0-9]*)$/\1@/
:d;{s/0@/@9/;/0@/bd}
s/1@/_0/
s/2@/_1/
s/3@/_2/
s/4@/_3/
s/5@/_4/
s/6@/_5/
s/7@/_6/
s/8@/_7/
s/9@/_8/
s/ _0*/ /
s/_//
s/^0//
/^2$/! b loop
G; x; z; x

s/\n/:\x00\n/g

:process
h
s/^([0-9]+):\x00\n.*/\1/
s/.*/\a&*2/
b n2h
:reth
H
b multiply
:result
s/^\a//
G
/^([0-9]+)(\n.*)\n\1:[\x00\cF]\n/ {
    s//\2\n\1:\cF\n/
    s/^\n\n+//
    s/$/#/
    h
    s/^[^\a]+//
    b multiply
}
/\n\a#+\*##$/ {
    s///
    s/^[0-9]+\n+//
    s/\x00/\cT/g
    h
    s/\n\n.*//
    x
    s/.*\n\n//
    G
    b format
}
s/\n\a.*//
s/^[0-9]+\n+//
s/^([0-9]+):\x00\n(.*)$/\2\n\1:\cT/

:mvf
s/^([0-9]+:\cF)\n(.*)$/\2\n\1/
t mvf

/^\n+2:/ ! b process

:format
s/\n[0-9]+:\cF//g
s/:\cT$//
s/:\cT\n/, /g
s/^\n+//

/.{70}/ {
    s/\b[0-9]\b/  &/g
    s/\b[0-9]{2}\b/ &/g
    s/(.{69}) ?/\1\n/g
}
