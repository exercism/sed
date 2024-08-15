v 4.9

/^\{\s*"property":\s*"isValid",\s*"isbn":\s*"(.*)"\s*\}$/ ! Q
s//\1/
s/-//g

/^[0-9]{9}[0-9X]$/ ! c false

h; s/./#/g; x

s/[0-9]/&\n/g
s/X/10\n/

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

s/^/\n/; s/$/\a/; G

:loop; s/\n(#*)\n(.*)\n(#+)#$/\n\1*#\3\n\2\n\3/; t loop
s/\n\a\n#$//
:uz; s/\n\*#+\n/\n/g; t uz

:mult; s/\n(#+)\*(#+)#/\n\1\n\1*\2/; t mult
s/\*#//g
s/\n//g

:mod; s/###########//; t mod

/^$/ c true
c false
