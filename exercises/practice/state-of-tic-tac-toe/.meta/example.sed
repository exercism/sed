v 4.9

:n;$!{N;bn}

s/^/\n/
s/$/\n/

/\nXX \n   \n   \n/{s/.*/Wrong turn order: X went twice/; q 1}
/\nOOX\n   \n   \n/{s/.*/Wrong turn order: O started/; q 1}
/\nXXX\nOOO/{
    s/.*/Impossible board: game should have ended after the game was won/
    q 1
}

/\n([OX])\1\1\n/       { s/.*/win/; q }
/([OX])..\n\1..\n\1/   { s/.*/win/; q }
/([OX]).\n.\1.\n.\1/   { s/.*/win/; q }
/([OX])\n..\1\n..\1/   { s/.*/win/; q }
/([OX])..\n.\1.\n..\1/ { s/.*/win/; q }
/([OX])\n.\1.\n\1/     { s/.*/win/; q }

/^[\nOX]+$/ { s/.*/draw/; q }

/ .* .* .* / { s/.*/ongoing/; q }
