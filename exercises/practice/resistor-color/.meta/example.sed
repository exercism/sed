v 4.9

/^$/ {
    c black: 0\nbrown: 1\nred: 2\norange: 3\nyellow: 4\ngreen: 5\nblue: 6\nviolet: 7\ngrey: 8\nwhite: 9
}

s/\s.*$//;

s/black/0/g
s/brown/1/g
s/red/2/g
s/orange/3/g
s/yellow/4/g
s/green/5/g
s/blue/6/g
s/violet/7/g
s/grey/8/g
s/white/9/g

/[^0-9 ]/ {
    s/.*/invalid color/w /dev/stderr
    Q1
}
