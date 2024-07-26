v 4.9

s/ .*//

s/$/\nblack:0/g
s/$/\nbrown:1/g
s/$/\nred:2/g
s/$/\norange:3/g
s/$/\nyellow:4/g
s/$/\ngreen:5/g
s/$/\nblue:6/g
s/$/\nviolet:7/g
s/$/\ngrey:8/g
s/$/\nwhite:9/g

/^\n/ { s///; s/:/: /g; n }

s/(\w+)\n.*\1:([0-9])+.*/\2/

/:/ {
    s/.*/invalid color/ w /dev/stderr
    q 1
}
