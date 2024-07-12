v 4.9

1 {h;d}
s/.*/\L&/
s/[[:space:]]//g
s/[[:punct:]]//g
y/abcdefghijklmnopqrstuvwxyz/zyxwvutsrqponmlkjihgfedcba/
x
G
/^encode\n/ {
    s///
    s/.{5}/& /g
    s/\s$//
}

s/^decode\n//
