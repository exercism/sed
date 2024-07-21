v 4.9

/^\s/        { s/.*/series cannot be empty/;          q 1 }
/\s-[0-9]+$/ { s/.*/slice length cannot be negative/; q 1 }
/\s0$/       { s/.*/slice length cannot be zero/;     q 1 }

h ; s/.* //

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

x; s/ .*$//; H
s/./#/g
G
s/^(#+)\n(#+)\n/\2\n\1\n/
h

/^(#+)\n\1\n/ { s/.*\n//; q }

s/^(#+)\n(#+)\n/\2\n\1\n/
/^(#+)\n\1#+\n/ {
    s/.*/slice length cannot be greater than series length/
    q 1
}
s/^(#+)\n(#+)\n/\2\n\1\n/


:loop
/^(#+)\n\1\n/ ! {
    s/.$//
    s/\n#/\n/
    b loop
}

s/.*\n//p

x
s/\n#/\n/
s/\n[0-9]/\n/
h

s/^(#+)\n(#+)\n/\2\n\1\n/
/^(#+)\n\1#+\n/Q
s/^(#+)\n(#+)\n/\2\n\1\n/

/^(#+)\n\1\n/ ! b loop
s/.*\n//
