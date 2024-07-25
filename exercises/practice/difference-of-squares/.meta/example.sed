v 4.9

s/ //g
s/property://
s/,number:/\n/

h; s/\n.*//; x; s/.*\n//

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

G
s/\n.*//; s/@//g
s/#+/&@&/
:sumup; s/^#//; s/^(#+)(@.*)/\1\2@\1/; /^#/ b sumup
x; G; h; z; x

:redo
/squareOfSum\n/ {
    s///
    h; s/\n[^\n]+$//
    x; s/\n[^\n]+$//; s/.*\n//; s/@//g; s/.*/&*&/
    s/^/\n/
    s/\*#/@*/
    :mu; s/\n(#+)@(.*)*#$/\n\1@\1\2/; t mu
    s/[@*\n]//g
    s/^/\f/
    x
    G
}

/sumOfSquares/ {
    s//&\v/
    x; G; h; s/@.*$//; x; s/^[^@]+@/@/
    s/(#+)/\1*\1/g
    s/^@//
    s/@/\n/g
    x; G; h
    s/.*\n//g
    :loop
    s/^/\n/
    s/\*#/@*/
    :multiply; s/\n(#+)@(.*)*#$/\n\1@\1\2/; t multiply
    s/[@*\n]//g
    G
    s/^(#+)\n([^\v]+\v#*)(\n.*)*\n[^\n]+$/\2\1\3/
    h
    /\*/ { s/.*\n//; b loop }
    z
    x
    s/sumOfSquares//
    s/\n$//
}


/differenceOfSquares/ {
    /\f/ ! {
        s/\n@.*/&&/
        s/\n/\nsquareOfSum\n/
        b redo
    }
    /\v/ ! {
        h; s/.*\n//; x; s/\n\f.*//
        s/\n/\nsumOfSquares\n/
        b redo
    }

    s/\ndifferenceOfSquares\n/\n/
    s/[\f\v]//g
    s/^(#+)\n(#+)$/\2\n\1/
    s/^(#+)\n\1(#+)*$/\2/
    /^$/ c 0
}

s/^[^\f\v]*[\f\v]//

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
