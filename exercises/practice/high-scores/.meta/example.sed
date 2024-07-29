v 4.9

1{h;d}

s/"property": ("\w+")/\1: /; G; s/\n//; s/"scores": //

/"scores":/ { g; n }
/"latest":/ { s/\[.*, //; s/\]$//; n }

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

H; g; s/ \[#.*//
x; s/.*\[/\n#/; s/, /\n#/g; s/\]$//
:rs; s/\n(#+)\n(\1#+)/\n\2\n\1/; t rs
s/\n#/\n/g
s/^\n*//;

H; g; s/\n.*//
x; s/[^\n]+\n//; s/:\n/: /

/"personalBest":/ { s/\n.*//; b h2n }

/"personalTopThree":/ {
    s/^([^\n]+(\n[^\n]+){2}).*/\1/
    s/\n/, /g; s/: /&[/; s/$/]/
    b h2n
}

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