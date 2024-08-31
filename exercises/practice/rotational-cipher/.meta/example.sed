v 4.9

:jl;$!{N;bjl}

s/^\{\s*|\s*\}$//g
s/"property"\s*:\s*"rotate"\s*,\s*//
s/"text"\s*:\s*"(.*)"\s*,\s*"shiftKey"\s*:\s*([0-9]+)$/\cT\1\n\cK\2/

h; s/\n.*//
x; s/.*\n//

:n2h
s/[0-9]/@&/g
s/0//g
s/1/#/g
s/2/##/g
s/3/###/g
s/4/####/g
s/5/#####/g
s/6/######/g
s/7/#######/g
s/8/########/g
s/9/#########/g
:tens; s/#@/@##########/g; t tens
s/@//g

s/^/\cAabcdefghijklmnopqrstuvwxyz\n/
s/\cA([a-z]+)\n/&\cR\1\n/

:rot
/\cK#/ {
    s/\cK#/\cK/
    s/\cR(\w)(\w+)/\cR\2\1/
    b rot
}
s/\n\cK/\n\cL/

:lookup
s/\cA(\w*)(\w)\n\cR(\w*)(\w)\n\cL/\cA\1\n\cR\3\n\cL\n\2:\4/
t lookup
s/\cA\n\cR\n//

s/\cL(.*)/&\U\1/

H; z; x
s/$/\n\cC/

:cipher
/\cT[[:alpha:]]/ {
    s/\cT(\w)([^\n]*)\n\cL(.*)\n\1:(\w)/\cT\1\v\4\2\n\cL\3\n\1:\4/
    s/\cT\w\v(\w)([^\n]*)(\n\cL\n[^\cC]+\n\cC.*)$/\cT\2\3\1/
    b cipher
}
/\cT[^\n]/ {
    s/\cT(.)(.*)/\cT\2\1/
    b cipher
}

s/^.*\cC//
