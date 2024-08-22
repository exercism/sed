v 4.9

:jl;$!{N;bjl}

s/\s+//g
s/^\{|\}$//g

s/"property":"create","queen":/\cC\n/
s/"property":"canAttack"//
s/,"(black|white)_queen":/\n/g

s/\{"position":\{"row":(-?[0-9]+),"column":(-?[0-9]+)\}\}/\1,\2\n/g
s/\n\n+/\n/g

/^\cC\n/ {
    /\n[0-7],[0-7]\n/ c 0
}
/\n-/ {
    s/.*/{ "error": "row not positive" }/ w /dev/stderr
    Q 1
}
/,-/ {
    s/.*/{ "error": "column not positive" }/ w /dev/stderr
    Q 1
}
/,[^0-7]\n/ {
    s/.*/{ "error": "column not on board" }/ w /dev/stderr
    Q 1
}
/\n[^0-7],/ {
    s/.*/{ "error": "row not on board" }/ w /dev/stderr
    Q 1
}

/\n(.),.\n\1/ c true
/,(.)\n.,\1/ c true

s/0/#/g
s/1/##/g
s/2/###/g
s/3/####/g
s/4/#####/g
s/5/######/g
s/6/#######/g
s/7/########/g

s/^\n|\n$//g

h; s/.*\n//

:dgir
s/^/#/
s/$/#/
G
/^(#+,#+)\n\1\n/ c true
s/\n.*//
/^#{8}|#{8}$/ ! b dgir

g; s/.*\n//
:dgil
s/^/#/
s/#$//
G
/^(#+,#+)\n\1\n/ c true
s/\n.*//
/^#,|,(#|#{8})$/ ! b dgil

g; s/.*\n//
:dgdr
s/^#//
s/$/#/
G
/^(#+,#+)\n\1\n/ c true
s/\n.*//
/^(#|#{8}),|(#|#{8})/ ! b dgdr

c false
