v 4.9

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

s/\s//
s/\s.*//
s/^0//
