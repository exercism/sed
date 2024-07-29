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

s/$/@/
h

:div2; s/##//; x; s/$/#/; x; /##/ b div2
H; g; s/\n(#*)@$/\1/
x; s/@.*/\n@/; x
s/$/#\n/

:permut; s/^(#+)@(##+)#(\n.*)$/\1@\2\3\n\2%\1/; t permut
s/^[^\n]+\n+//

H; g

:loop
s/\n#+%#+$//;
x
s/.*\n//
:mod; s/^(#+)%\1(#*)$/\1%\2/; t mod
s/#+%#+//
s/%$//
H; g
s/@(.*\n)(#+)$/@\2\1/
s/\n$//
h
/%/ b loop

s/\n@/@#/

/^(#+)@\1$/   c perfect
/^(#+)@\1#+$/ c abundant
c deficient
