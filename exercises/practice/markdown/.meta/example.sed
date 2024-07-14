v 4.9

:loop
$ ! N
$ ! b loop

# emphasis
s|^[^#*].*|<p>&</p>|gM
s|^#######.*|<p>&</p>|gM
s|__([^_]+)__|<strong>\1</strong>|g
s|_([^_]+)_|<em>\1</em>|g

# headers
s|^#\s(.*)|<h1>\1</h1>|gM
s|^##\s(.*)|<h2>\1</h2>|gM
s|^###\s(.*)|<h3>\1</h3>|gM
s|^####\s(.*)|<h4>\1</h4>|gM
s|^#####\s(.*)|<h5>\1</h5>|gM
s|^######\s(.*)|<h6>\1</h6>|gM

# lists
s|^(\*\s[^\n]+)(\n*\*[^\n]+)*|\v\1\2\v|gM
s|^(\v*)\*\s([^\n\v]+)|\1<li>\2</li>|gM
s|\v([^\v]+)\v|<ul>\1</ul>|g

s/\n//g
