v 4.9

:loop
$ ! N
$ ! b loop

s/\n\n/,-,/
s/\n/,/g
s/^/,/
s/$/,/
s/,,/,/g

/^(.*)-\1$/              { s/.*/equal/;     q }
/^([^-]+)-.*\1.*$/       { s/.*/sublist/;   q }
/^[^-]+,-,$/             { s/.*/superlist/; q }
/^[^-]*([^-]+)[^-]*-\1$/ { s/.*/superlist/; q }

s/.*/unequal/
