v 4.9

s/[().+-]//g;

/[[:alpha:]]/ {
    s/.*/letters not permitted/
    q 1
}

/[[:punct:]]/ {
    s/.*/punctuations not permitted/
    q1
}

s/[^0-9]+//g

/^.{0,9}$/ {
    s/.*/must not be fewer than 10 digits/
    q 1
}

/^.{12,}/ {
    s/.*/must not be greater than 11 digits/
    q 1
}

/^[2-9].{10}/ {
    s/.*/11 digits must start with 1/
    q 1
}

/^1.{10}/s/^1//

/^0/ {
    s/.*/area code cannot start with zero/
    q 1
}

/^1/ {
    s/.*/area code cannot start with one/
    q 1
}

/^.{3}0/ {
    s/.*/exchange code cannot start with zero/
    q 1
}

/^.{3}1/ {
    s/.*/exchange code cannot start with one/
    q 1
}
