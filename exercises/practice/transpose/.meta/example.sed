v 4.9

:jl;$!{N;bjl}

/^$/q
/\n/ !      { s/./\n&/g; s/ +\n/\n/g; s/^\n//; q }
/^.(\n.)+$/ { s/\n//g; q }

h
s/$/\n/
s/[^\n]/ /g

:lmax
s/^( +)\n\1\n/\1\n/
s/^( +)\n(\1 +\n)/\2/
s/^( +)\n( +)\n/\2\n\1\n/
t lmax

s/\n$//
x; s/$/\n/; s/\n/@\n/g
x; G

:aws; s/^( +)\n([^@]+)@/\1\n\2\1/; t aws
s/\n$//; s/\n/\n@/g
:pad; s/\n([^@]*)@(.)/\n\1\2@/g; s/^ //; /^\n/ ! b pad
s/@ *//g; s/\n//
h; z; x

:loop
s/^/\n/
s/\n(.)/\n\1@/g
:row; s/^([^@]+)@([^@]*)\n(.)@/\1\3@\2\n/; t row
x; G; h; g; s/@.*//; x; s/.*@//
/^.\n.$|^\n+$/ ! b loop

s/\n//; x; G
s/^\n+//; s/\n+$//; s/\n\n+/\n/g; s/ +\n/\n/g; s/ +$//
