v 4.9

s/x: /\n/
s/y: /\n\n/
s/$/\n/
s/[, -]+//g
s/\.0+//g

/\./ {
    s/\n([0-9])+\n/\n\10\n/
    s/\n([0-9]+)\.([0-9])\n/\n\1\2\n/g
    s|$|/|
}

s/\n\n+/\n/g
s/([0-9]+)/\1*\1/g

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

s/@+//g

s/\*#/@*/g

h; s/^\n[^\n]+//
x; s/(\n[^\n]+).*/\1/

:xy
:multiply; s/\n(#+)@(.*)*#$/\n\1@\1\2/; t multiply
s/[@*]//g
x
/\*/ {
    \|\n/$| {
        s///
        x
        s|$|\n/|
        x
    }
    s/\n$//
    b xy
}

x;G;s/\n//g;h;z;x

\|/$| {
    s///
    :subtract;
    /#{100}/ {
        s///
        x
        s/^/#/
        x
        b subtract
    }
    x
    G
    s/\n#+/#/
}

/^#{0,1}$/    c 10
/^#{2,25}$/   c  5
/^#{26,100}$/ c  1
c 0
