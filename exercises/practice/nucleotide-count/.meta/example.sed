v 4.9

b main

:error
s/.*/Invalid nucleotide in strand/ w /dev/stderr
Q 1

:main
/^"property": "nucleotideCounts", "strand": / ! Q
s///; s/^"//; s/"$//

s/$/\nA:\nC:\nG:\nT:\n/

:count
s/^([A-Z])([^\n]*)(.*)\n\1:(.*)$/\2\3\n\1:#\4/
T error
/^\n/ ! b count

:h2n
s/##########/@/g
s/@([0-9]*)([^0-9#@]|$)/@0\1\2/g
s/#########/9/g
s/########/8/g
s/#######/7/g
s/######/6/g
s/#####/5/g
s/####/4/g
s/###/3/g
s/##/2/g
s/#/1/g
s/@/#/g
t h2n

s/\n([A-Z]):/\n"\1": /g
s/: \n/: 0\n/g
s/^\n//
