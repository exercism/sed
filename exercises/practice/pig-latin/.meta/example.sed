v 4.9

h
:loop
s/\s.*//; x; s/^\w+\s?//; x

/^([aeiou]|xr|yt)/                 {s/$/ay/;    s/^/@/; H; g; /^\n?@/!b loop}
/^([bcdfghjklmnpqrstvwxyz]+)(y.*)/ {s//\2\1ay/; s/^/@/; H; g; /^\n?@/!b loop}
/^([bcdfghjklmnpqrstvwxyz]*qu)(.*)/{s//\2\1ay/; s/^/@/; H; g; /^\n?@/!b loop}
/^([bcdfghjklmnpqrstvwxyz]+)(.*)/  {s//\2\1ay/; s/^/@/; H; g; /^\n?@/!b loop}

s/^\s//; s/@//g; s/\n/ /g
