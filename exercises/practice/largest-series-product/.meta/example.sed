v 4.9

b main

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
/\cS/ b span
/\cP/ b products

:main
:jl;$!{N;bjl}

s/\s+//g
s/\}$//
s/^\{"property":"largestProduct",//
s/\s+//g

/,"span":0$/ c 1

/^"digits":"","span":[1-9]/ {
    s/.*/{"error":"span must be smaller than string length"}/ w /dev/stderr
    Q 1
}

/"digits":"([0-9]+)"/ ! {
    s/.*/{"error":"digits input must only contain digits"}/ w /dev/stderr
    Q 1
}
s//\cD\1/
/\cD0+,/ c 0

/"span":-/ {
    s/.*/{"error":"span must not be negative"}/ w /dev/stderr
    Q 1
}
s/"span":([0-9]+)$/\cS\1/
s/,/\n/

h; s/\n.*//
x; s/.*\n//

b n2h
:span
x; s/.*/&\n&/
s/^\cD/\cL/
G; h
s/\n.*//;
s/[0-9]/#/g
H; g
s/\cL[0-9]+\n//
h

/\cS(#+)#\n\cL\1$/ {
    s/.*/{"error":"span must be smaller than string length"}/ w /dev/stderr
    Q 1
}

:series
s/\cD/&,/
s/\cS/&,/
:split
/\cS#+,\n/ ! {
    s/,([0-9#])/\1,/g
    b split
}

s/\cD//
s/,.*//
s/[0-9]/&*/g
s/\*$//
s/^/\cP/
H; g
s/\cD[0-9]/\cD/
s/\cL#/\cL/
h
s/\n\cP.*//
/\cS(#+)\n\cL\1/ b series

g
s/^[^\cP]+//
s/$/\n/
:nozero
s/\cP0[0-9*]+\n//g; t nozero
s/\cP[0-9*]+0\n//g; t nozero
s/\cP[0-9*]+0[0-9*]+\n//g; t nozero
/^$/ c 0

s/\*1//g
s/\cP1\*/\cP/g

b n2h
:products
s/\cP//g
s/^/\n/
s/\n/\n@/g
s/@$/\n/

:multiply
s/@(#+)\*(#+)#/\1@\1*\2/g
s/\n(#+)@(#+)\*#\*/\n@\1\2*/g
s/@(#+)\*#\n/\1\n/g
/\*#/ b multiply
s/@//g
s/[@\n]+$/\n/

:max
/\n(#+)(\n\1#*\n)/ {
    s//\2/
    t max
}
s/(\n(#+)#+)\n\2\n/\1\n/; t max
s/\n//g

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
