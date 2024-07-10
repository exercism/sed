v 4.9
:loop; $ b main; N; b loop;

:main

/^[[:space:]]*$/ {
    c Fine. Be that way!
    q
}

/^[0-9[:punct:][:blank:]]+\?\s*$/ {
    c Sure.
    q
}

/^[0-9[:punct:][:blank:]]+$/ {
    c Whatever.
    q
}

/^[A-Z0-9[:punct:][:blank:]]+\?\s*$/ {
    c Calm down, I know what I'm doing!
    q
}

/^[A-Z0-9[:punct:][:blank:]]+$/ {
    c Whoa, chill out!
    q
}

/\?\s*$/ {
    c Sure.
    q
}

c Whatever.
