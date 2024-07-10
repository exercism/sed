v 4.9

: loop
s/\{[^][)(}{]*\}//g; t loop
s/\[[^][)(}{]*\]//g; t loop
s/\([^][)(}{]*\)//g; t loop

/[][)(}{]/ {
    c false
    q
}

c true
