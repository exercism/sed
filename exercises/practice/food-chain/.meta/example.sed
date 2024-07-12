v 4.9

s/^([0-9]+)\s\1$/\1 0/

b main

:compute
x
s/\s1$/ 0/
s/\s2$/ 1/
s/\s3$/ 2/
s/\s4$/ 3/
s/\s5$/ 4/
s/\s6$/ 5/
s/\s7$/ 6/
s/\s8$/ 7/
/\s0$/Q
s/^7\s/8 /
s/^6\s/7 /
s/^5\s/6 /
s/^4\s/5 /
s/^3\s/4 /
s/^2\s/3 /
s/^1\s/2 /

:main

/^1\s/ {
    h;z
    i I know an old lady who swallowed a fly.
    i I don't know why she swallowed the fly. Perhaps she'll die.
    i
    b compute
}

/^2\s/ {
    h;z
    i I know an old lady who swallowed a spider.
    i It wriggled and jiggled and tickled inside her.
    i She swallowed the spider to catch the fly.
    i I don't know why she swallowed the fly. Perhaps she'll die.
    i
    b compute
}

/^3\s/ {
    h;z
    i I know an old lady who swallowed a bird.
    i How absurd to swallow a bird!
    i She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    i She swallowed the spider to catch the fly.
    i I don't know why she swallowed the fly. Perhaps she'll die.
    i
    b compute
}

/^4\s/ {
    h;z
    i I know an old lady who swallowed a cat.
    i Imagine that, to swallow a cat!
    i She swallowed the cat to catch the bird.
    i She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    i She swallowed the spider to catch the fly.
    i I don't know why she swallowed the fly. Perhaps she'll die.
    i
    b compute
}

/^5\s/ {
    h;z
    i I know an old lady who swallowed a dog.
    i What a hog, to swallow a dog!
    i She swallowed the dog to catch the cat.
    i She swallowed the cat to catch the bird.
    i She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    i She swallowed the spider to catch the fly.
    i I don't know why she swallowed the fly. Perhaps she'll die.
    i
    b compute
}

/^6\s/ {
    h;z
    i I know an old lady who swallowed a goat.
    i Just opened her throat and swallowed a goat!
    i She swallowed the goat to catch the dog.
    i She swallowed the dog to catch the cat.
    i She swallowed the cat to catch the bird.
    i She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    i She swallowed the spider to catch the fly.
    i I don't know why she swallowed the fly. Perhaps she'll die.
    i
    b compute
}

/^7\s/ {
    h;z
    i I know an old lady who swallowed a cow.
    i I don't know how she swallowed a cow!
    i She swallowed the cow to catch the goat.
    i She swallowed the goat to catch the dog.
    i She swallowed the dog to catch the cat.
    i She swallowed the cat to catch the bird.
    i She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
    i She swallowed the spider to catch the fly.
    i I don't know why she swallowed the fly. Perhaps she'll die.
    i
    b compute
}

/^8\s/ {
    h;z
    i I know an old lady who swallowed a horse.
    i She's dead, of course!
}
