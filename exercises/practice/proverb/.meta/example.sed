v 4.9

/^$/q
/^nail$/{ s//And all for the want of a nail./; q }

:loop
/^(\w+)\s(\w+)\b.*\n?/ {
    s//&\nFor want of a \1 the \2 was lost./
    s/^\w+\s//
    H
    /^\w+ \w+/ b loop
}

g
s/.*\n\w+\n//
/\bpin/ {
    a And all for the want of a pin.
    q
}

a And all for the want of a nail.
