v 4.9

/^score: 0+$/ Q
/, score: 0+$/ c false

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

s/\s//g
s/^(item:\w+)?,?score:/\1,/
h; s/,.*/,/; x; s/.*,//

:mod; s/#{256}//; t mod

/#{128}/ { s///; x; s/,/,\ncats/; x }
/#{64}/  { s///; x; s/,/,\npollen/; x }
/#{32}/  { s///; x; s/,/,\nchocolate/; x }
/#{16}/  { s///; x; s/,/,\ntomatoes/; x }
/#{8}/   { s///; x; s/,/,\nstrawberries/; x }
/#{4}/   { s///; x; s/,/,\nshellfish/; x }
/#{2}/   { s///; x; s/,/,\npeanuts/; x }
/#{1}/   { s///; x; s/,/,\neggs/; x }

x

/^item:/ {
    s///
    s/$/\n/
    /(\w+),.*\n\1\n/ c true
    c false
}

s/,\n//
