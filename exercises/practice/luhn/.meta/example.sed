v 4.9

:jl;$!{N;bjl}

/^\{\s*"property":\s*"valid",\s*"value":\s*"(.*)"\s*}$/ ! Q
s//\1/
s/\s+//g

/^.?$/   c false
/[^0-9]/ c false

/^0+$/   c true

s/^/0000000000000000/; s/^0+(.{16})$/\1/

s/^[0-9]/<&> /
s/([0-9])([0-9])/\1 <\2> /g

s/<0>/0/g
s/<1>/2/g
s/<2>/4/g
s/<3>/6/g
s/<4>/8/g
s/<5>/1 0/g
s/<6>/1 2/g
s/<7>/1 4/g
s/<8>/1 6/g
s/<9>/1 8/g

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

s/\s+//g

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

/0$/ c true
c false
