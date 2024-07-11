v 4.9

b main
:decrement

s/^1\s/0 /
s/^2\s/1 /
s/^3\s/2 /
s/^4\s/3 /
s/^5\s/4 /
s/^6\s/5 /
s/^7\s/6 /
s/^8\s/7 /
s/^9\s/8 /
s/^10\s/9 /

s/\s1$/ 0/
s/\s2$/ 1/
s/\s3$/ 2/
s/\s4$/ 3/
s/\s5$/ 4/
s/\s6$/ 5/
s/\s7$/ 6/
s/\s8$/ 7/
s/\s9$/ 8/
s/\s10$/ 9/
/\s0$/Q

:main
/^10\s/ {
    h; z
    i Ten green bottles hanging on the wall,
    i Ten green bottles hanging on the wall,
    i And if one green bottle should accidentally fall,
    i There'll be nine green bottles hanging on the wall.
    i
    x; b decrement
}

/^9\s/ {
    h; z
    i Nine green bottles hanging on the wall,
    i Nine green bottles hanging on the wall,
    i And if one green bottle should accidentally fall,
    i There'll be eight green bottles hanging on the wall.
    i
    x; b decrement
}

/^8\s/  {
    h; z
    i Eight green bottles hanging on the wall,
    i Eight green bottles hanging on the wall,
    i And if one green bottle should accidentally fall,
    i There'll be seven green bottles hanging on the wall.
    i
    x; b decrement
}

/^7\s/ {
    h; z
    i Seven green bottles hanging on the wall,
    i Seven green bottles hanging on the wall,
    i And if one green bottle should accidentally fall,
    i There'll be six green bottles hanging on the wall.
    i
    x; b decrement
}

/^6\s/ {
    h; z
    i Six green bottles hanging on the wall,
    i Six green bottles hanging on the wall,
    i And if one green bottle should accidentally fall,
    i There'll be five green bottles hanging on the wall.
    i
    x; b decrement
}

/^5\s/ {
    h; z
    i Five green bottles hanging on the wall,
    i Five green bottles hanging on the wall,
    i And if one green bottle should accidentally fall,
    i There'll be four green bottles hanging on the wall.
    i
    x; b decrement
}

/^4\s/ {
    h; z
    i Four green bottles hanging on the wall,
    i Four green bottles hanging on the wall,
    i And if one green bottle should accidentally fall,
    i There'll be three green bottles hanging on the wall.
    i
    x; b decrement
}

/^3\s/ {
    h; z
    i Three green bottles hanging on the wall,
    i Three green bottles hanging on the wall,
    i And if one green bottle should accidentally fall,
    i There'll be two green bottles hanging on the wall.
    i
    x; b decrement
}

/^2\s/ {
    h; z
    i Two green bottles hanging on the wall,
    i Two green bottles hanging on the wall,
    i And if one green bottle should accidentally fall,
    i There'll be one green bottle hanging on the wall.
    i
    x; b decrement
}

/^1\s/ {
    h; z
    i One green bottle hanging on the wall,
    i One green bottle hanging on the wall,
    i And if one green bottle should accidentally fall,
    i There'll be no green bottles hanging on the wall.
    i
    x; b decrement
}

Q
