v 4.9

b main

:fail
s/.*/error/ w /dev/stderr
Q 1

:main

/^\{\s*/ ! Q 1
s///
/\s*\]\s*\}$/ ! Q 1
s///
s/\s+//g

/,"sides":\[/ ! Q 1
s//\n/
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

s/.*/&\n&/; s/,//; /^(#+)#+,\1\n/ ! b fail; s/.*\n//
s/.*/&\n&/; s/,(#+\n)/\1/; /^(#+),\1#+/ ! b fail; s/.*\n//
s/.*/&\n&/; s/^([#,]+),(#+)\n/\2\1\n/; /^(#+)#+,\1\n/ ! b fail; s/.*\n//

x

/^"property":"equilateral"$/ {
    x
    /^(#+),\1,\1$/ c true
}

/^"property":"isosceles"$/ {
    x
    /^(#+),\1,/    c true
    /^(#+),#+,\1$/ c true
    /,(#+),\1$/    c true
}

/^"property":"scalene"$/ {
    x
    s/^/,/; s/$/,/
    :sor; s/,((#+)#+),(\2),/,\2,\1,/g; t sor
    /^,(#+),(\1#+),(\2)#+,/ c true
}

c false
