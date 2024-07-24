v 4.9

s/year:\s//

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

:mod100; s/#{100}//; t mod100
/#/ {
    x; h
    :mod4; s/#{4}//; t mod4
    /^$/ c true
}
/^$/ {
    x; h
    :mod400; s/#{400}//; t mod400
    /^$/ c true
}
c false
