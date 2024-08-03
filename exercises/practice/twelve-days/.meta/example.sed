v 4.9

/^"property": "recite", / ! Q 1
s///
/^"(start)Verse": ([0-9]+), "(end)Verse": ([0-9]+)$/ ! Q 1
s//\1:\2,\3:\4/
s/12/############/g
s/11/###########/g
s/10/##########/g
s/9/#########/g
s/8/########/g
s/7/#######/g
s/6/######/g
s/5/#####/g
s/4/####/g
s/3/###/g
s/2/##/g
s/1/#/g
h

s/.*/On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree./
G
/\nstart:#,/P
/,end:#$/Q
/\nstart:(#),end:\1#+$/ { x; s/:/:#/; x }
s/\n.*//

s/first/second/
s/me:/& two Turtle Doves, and/
G
/\nstart:##,/P
/,end:##$/Q
/\nstart:(##),end:\1#+$/ { x; s/:/:#/; x }
s/\n.*//

s/second/third/
s/me:/& three French Hens,/
G
/\nstart:###,/P
/,end:###$/Q
/\nstart:(#{3}),end:\1#+$/ { x; s/:/:#/; x }
s/\n.*//

s/third/fourth/
s/me:/& four Calling Birds,/
G
/\nstart:####,/P
/,end:####$/Q
/\nstart:(#{4}),end:\1#+$/ { x; s/:/:#/; x }
s/\n.*//

s/fourth/fifth/
s/me:/& five Gold Rings,/
G
/\nstart:#####,/P
/,end:#####$/Q
/\nstart:(#{5}),end:\1#+$/ { x; s/:/:#/; x }
s/\n.*//

s/fifth/sixth/
s/me:/& six Geese-a-Laying,/
G
/\nstart:######,/P
/,end:######$/Q
/\nstart:(#{6}),end:\1#+$/ { x; s/:/:#/; x }
s/\n.*//

s/sixth/seventh/
s/me:/& seven Swans-a-Swimming,/
G
/\nstart:#######,/P
/,end:#######$/Q
/\nstart:(#{7}),end:\1#+$/ { x; s/:/:#/; x }
s/\n.*//

s/seventh/eighth/
s/me:/& eight Maids-a-Milking,/
G
/\nstart:########,/P
/,end:########$/Q
/\nstart:(#{8}),end:\1#+$/ { x; s/:/:#/; x }
s/\n.*//

s/eighth/ninth/
s/me:/& nine Ladies Dancing,/
G
/\nstart:#########,/P
/,end:#########$/Q
/\nstart:(#{9}),end:\1#+$/ { x; s/:/:#/; x }
s/\n.*//

s/ninth/tenth/
s/me:/& ten Lords-a-Leaping,/
G
/\nstart:##########,/P
/,end:##########$/Q
/\nstart:(#{10}),end:\1#+$/ { x; s/:/:#/; x }
s/\n.*//

s/tenth/eleventh/
s/me:/& eleven Pipers Piping,/
G
/\nstart:###########,/P
/,end:###########$/Q
/\nstart:(#{11}),end:\1#+$/ { x; s/:/:#/; x }
s/\n.*//

s/eleventh/twelfth/
s/me:/& twelve Drummers Drumming,/
