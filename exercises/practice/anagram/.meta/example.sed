v 4.9

:rmdup
s/^(\w+)(.*)\b\1\b/\1\2/i; t rmdup
s/\s\s+/ /g
s/\s$//

:main
h
s/^(\w+) (\w+)\b.*$/\1 \2/

:loop
s/^(\w*)(\w)(\w*) (\w*)\2(\w*)$/\1\3 \4\5/i; t loop

/\w/ {
    z
    x
    s/^(\w+) \w+\b(.*?)/\1\2/; t main
}

/^\s$/ {
    z
    x
    s/^(\w+) (\w+)\b(.*)/\1\3\n\2/; t main
}

s/^\w+\b//
s/^[[:space:]]*//
s/\n/ /g
