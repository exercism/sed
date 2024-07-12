v 4.9

1 {
    N
    s/\n/ /
    x
    s/.*/0/
    x
    /^ $/ b end
    /^ / {
        s/.*/first strand must not be empty/ 
        w /dev/stderr
        Q 1
    }
    / $/ {
        s/.*/second strand must not be empty/
        w /dev/stderr
        Q 1
    }
}

b main

:compute
x
:d
s/9(_*)$/_\1/
td
s/^(_*)$/1\1/; tn
s/8(_*)$/9\1/; tn
s/7(_*)$/8\1/; tn
s/6(_*)$/7\1/; tn
s/5(_*)$/6\1/; tn
s/4(_*)$/5\1/; tn
s/3(_*)$/4\1/; tn
s/2(_*)$/3\1/; tn
s/1(_*)$/2\1/; tn
s/0(_*)$/1\1/; tn
:n
y/_/0/
x

:main
/^(\w+)(\w*) \1(\w*)$/{
    s//\2 \3/
    b main
}
/^\w(\w*) \w(\w*)$/ {
    s//\1 \2/
    b compute
}

/^[A-Z]+ $|^ [A-Z]+$/ {
    s/.*/strands must be of equal length/
    w /dev/stderr
    Q 1
}

:end
x
