v 4.9

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

s/^@@+/@/
h; s/#+$//; x
s/^@+/##%/

:mod
/^(##)%\1(.*)/ { s//\1%\2/; x; s/$/#/; x; b mod; }

/%$/  { x; s/^/0/; x }
/%#$/ { x; s/^/1/; x }

s/#$//

x
/@#/ {
    G
    s/@(#+)\n(##%)$/@\2\1/
    h
    s/#.*//
    x
    s/^[^@]+@//
    b mod
}

s/@$//
s/0//g
s/1/#/g

:num2str
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
t num2str

s/^$/0/
