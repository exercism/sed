v 4.9

:jl;$!{N;bjl}

s/\s*\}\s*}//
s/^\{\s*"property"\s*:\s*"transform",\s*//
s/^"legacy"\s*:\s*\{\s*//
s/\s*, *\n */\n/g

s/[]"[]//g
s/\s*,\s*//g
s/:\s/:/g
s/.*/\L&/
s/$/\n/
s/\n/@\n/g
s/^/\n/

:cnv; s/\n([0-9]+):([a-z])([a-z]*)@/\n\1:\3@,\2:\1/g; t cnv

s/\n[0-9]+:@,/\n/g
s/,/\n/g

s/$/@/
s/([^@]*)(\nz:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\ny:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nx:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nw:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nv:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nu:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nt:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\ns:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nr:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nq:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\np:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\no:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nn:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nm:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nl:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nk:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nj:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\ni:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nh:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\ng:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nf:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\ne:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nd:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nc:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\nb:[0-9]+)(\n[^@]*)@/\1\3@\2/
s/([^@]*)(\na:[0-9]+)(\n[^@]*)@/\1\3@\2/

s/:/: /g
s/([0-9])\n/\1,\n/g
s/[a-z]/  "&"/g

s/^[\n@]+/{\n/
s/$/\n}/
