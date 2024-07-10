v 4.9

/^\S+$|\sand\s/  {
   s/^/Hello, /; q
}

/^$|\s|\0/ {
    s/.*/Usage: error-handling.sh <person>/ w /dev/stderr
    Q 1
}
