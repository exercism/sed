v 4.9

:jl;$!{N;bjl}

s/\s+//g
s/^\{|\}$//g

s/"property":"rebase",//

/"inputBase":(-[0-9]+|[01]),/ {
    s/.*/{"error":"input base must be >= 2"}/ w /dev/stderr
    Q 1
}
s/"inputBase":(-?[0-9]+),/\cI\1\n/

/"digits":\[[0,]*\]/ c [0]
s/"digits":\[([0-9,-]+)\],/\cD,\1,\n/


/"outputBase":(-[0-9]+|[01])$/ {
    s/.*/{"error":"output base must be >= 2"}/ w /dev/stderr
    Q 1
}
s/"outputBase":(-?[0-9]+)$/\cO\1/

s/(\cD[^\n]+)\n(\cO.*)/\2\n\1/

/\cD[^\n]*-/ {
    s/.*/{"error":"all digits must satisfy 0 <= d < input base"}/ w /dev/stderr
    Q 1
}

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

h
s/.*\n//
s/[^,]+//g
s/,/#/g
s/^##/\cN#/
H; z; x
s/(\cD[#,]+)\n(\cN#+)$/\2\n\1/

/\cI(#+)\n.*\cD[^\n]*,\1#*,/ {
    s/.*/{"error":"all digits must satisfy 0 <= d < input base"}/ w /dev/stderr
    Q 1
}

s/,/\n/g
s/\cD\n/&@/
:pn
s/^(\cI(#+)\n\cO#+)(\n\cN(#*))#(\n\cD[^@]+)@(#*)\n/\1\3\5\6*\2^\4\n@/
t pn
s/@$//
s/\n\*[^\n]+//g
s/\*#+\^\n//g
s/^\cI#+\n//
s/\n\cN\n/\n/

:exp; s/\*(#+)\^(#+)#\n/*\1*\1^\2\n/; t exp
s/\^#\n/\n/g
s/\n(#+\*)/\n@\1/g

:mul
s/\n(#*)@(#+)\*(#+)#([^#])/\n\1\2@\2*\3\4/g
s/\n(#+)@(#+)\*#\*/\n@\1\2*/g
s/\*#\n/\n/g
/\*/ b mul
s/@//g
:sum; s/\cD(.*)\n/\cD\1/; t sum

s/\cO//
s/\n\cD/%/
s/$/\n\cR\n\cC/

:modh
/^(#+)%\1/ { s//\1%/; s/\cR/&#/; b modh }
s/%\n/%0\n/
s/^(#+%)([0#]+)\n\cR(#+)\n\cC/\1\3\n\cR\n\cC\n\2/
t modh
s/#+%(#+)\n\cR\n\cC/\1/

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

/^\cO10\n\cD/ { s///; s/./&, /g }
s/\n/, /g
s/^/[/
s/$/]/
