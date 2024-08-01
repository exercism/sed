v 4.9

/^"property": "steps", "number": / ! Q 1
s///

/^-|^0$/ {
    s/.*/Only integers greater than 1 are allowed/ w /dev/stderr
    Q 1
}

/^1$/ c 0

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

s/$/\n\f\n\v/

:loop
h; s/\n.*//
:mod2; /##/ { s///; x; s/\f/&#/; x; /^#?$/ ! b mod2 }
/#/ {
    g
    s/\f#+/\f/
    s/\v/\v#/
    s/^#+/&&&#/
    b loop
}
/^$/ {
    g
    s/^#+\n\f(#+)/\1\n\f/
    s/\v/\v#/
    /^#\n/ ! b loop
}

s/.*\v//

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
