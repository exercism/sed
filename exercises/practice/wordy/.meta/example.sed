v 4.9

b main

:synerr; s/.*/syntax error/;      q 1
:unkop;  s/.*/unknown operation/; q 1

:main
s/\?$//
/^What is/ ! b unkop; s///; s/^ //

s/ ?plus ?/+/g
s/ ?minus ?/-/g
s| ?divided by ?|/|g
s/ ?multiplied by ?/*/g

\|^-?[0-9]+[/*+-]$| b synerr
/^$/                b synerr
/\+\+/              b synerr
/[0-9]\s-?[0-9]/    b synerr
/[[:alpha:]]/       b unkop

s/--/+/

\|^-[0-9]+[*/]| { x; s/$/!/; x; s/^-// }
\|[*/]-|        { x; s/$/!/; x; s|([*/])-|\1| }

/^-([0-9]+)\+([0-9]+)/          { s//\2-\1/;    b num2str }
/^([0-9]+)-([0-9]+)-([0-9]+)$/  { s//\1-\2+\3/; b num2str }
/^(-[0-9]+)\+-([0-9]+)$/        { s//\1+\2/;    b num2str }
/^([0-9]+)-([0-9]+)\+([0-9]+)$/ { s//\1-\2-\3/; b num2str }

:num2str
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
s/\+//g

:subtract; s/#-#/-/g; t subtract; s/-$//

s/-[*]/*/

/\*/ {
    :mult
    s/\*/@*/; s/#$//
    :multiply; s/^(#+)@(.*)*#$/\1@\1\2/; t multiply
    s/@//; s/\*$//
    /\*/ b mult
}

\|/| {
    \|^-@#+//#+$| {
        s|^-@#+/||
        x; G; s/\n//
        s/^(!+)(#+)\n@#+/\1\2/
        h; s/[^!]+//g; x; s/^!+//
    }

    /@/ ! s|/|@|
    s|//|/|
    s/-//

    /^@/ ! {
        s|@(#+)|-\1@\1/|
        x; s/$/#/; x
        b subtract
    }
    z; x
}

:str2num
s/##########/@/g
s/@([0-9]*)$/@0\1/
s/#########/9/
s/########/8/
s/#######/7/
s/######/6/
s/#####/5/
s/####/4/
s/###/3/
s/##/2/
s/#/1/
s/@/#/g
t str2num

x; G; s/\n//

s/^$/0/
s/-$//

:neg; s/^!!//; t neg; s/^!/-/