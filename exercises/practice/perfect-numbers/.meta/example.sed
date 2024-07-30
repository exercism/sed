v 4.9

/^"property": "classify", "number": / ! Q
s///

/^-|^0$/ {
    s/.*/Classification is only possible for positive integers./ w /dev/stderr
    Q 1
}

/^1$/ c deficient

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

s/^/\n/; h; s/^\n//
:div2; s/##//; x; s/^/#/; x; /##/ b div2
G; s/\n//; s/\n/%/; h

:loop
/^(#+)%(\1)+$/ { s/%#+//; H; g }
s/^#//; x; s/^#//; x; s/\n.*//
/^##/ b loop

g; s/^#%#//; s/\n/@/; s/\n//g

/^(#+)@\1$/   c perfect
/^(#+)@\1#+$/ c abundant
c deficient
