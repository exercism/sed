v 4.9

1 { s/^([0-9]+) ([0-9]+)$/1 \2\n\1/; h }

/^1 / {
    x; s/.*/This is the house that Jack built./
    x; /^1 1\n/ { x; q }
    /\n1$/ { x; p; x }
    s/^1\b/2/; s/\b1$/2/
}

/^2 / {
    x; s/\bis\b/& the malt that lay in/
    x; /^2 2\n/ { x; q }
    /\n2$/ { x; p; x }
    s/^2\b/3/; s/\b2$/3/
}

/^3 / {
    x; s/\bis\b/& the rat that ate/
    x; /^3 3\b/ { x; q }
    /\n3$/ { x; p; x }
    s/^3\b/4/; s/\b3$/4/
}

/^4 / {
    x; s/\bis\b/& the cat that killed/
    x; /^4 4\n/ { x; q }
    /\n4$/ { x; p; x }
    s/^4\b/5/; s/\b4$/5/
}

/^5 / {
    x; s/\bis\b/& the dog that worried/
    x; /^5 5\n/ { x; q }
    /\n5$/ { x; p; x }
    s/^5\b/6/; s/\b5$/6/
}

/^6 / {
    x; s/\bis\b/& the cow with the crumpled horn that tossed/;
    x; /^6 6\n/ { x; q }
    /\n6$/ { x; p; x }
    s/^6\b/7/; s/\b6$/7/
}

/^7 / {
    x; s/\bis\b/& the maiden all forlorn that milked/
    x; /^7 7\n/ { x; q }
    /\n7$/ { x; p; x }
    s/^7\b/8/; s/\b7$/8/
}

/^8 / {
    x; s/\bis\b/& the man all tattered and torn that kissed/
    x; /^8 8\n/ { x; q }
    /\n8$/ { x; p; x }
    s/^8\b/9/; s/\b8$/9/
}

/^9 / {
    x; s/\bis\b/& the priest all shaven and shorn that married/
    x; /^9 9\n/ { x; q }
    /\n9$/ { x; p; x }
    s/^9\b/10/; s/\b9$/10/
}

/^10 / {
    x; s/\bis\b/& the rooster that crowed in the morn that woke/
    x; /^10 10\n/ { x; q }
    /\n10$/ { x; p; x }
    s/^10\b/11/; s/\b10$/11/
}

/^11 / {
    x; s/\bis\b/& the farmer sowing his corn that kept/
    x; /^11 11\n/ { x; q }
    /\n11$/ { x; p; x }
    s/^11\b/12/; s/\b11$/12/
}

/^12 / {
    x; s/\bis\b/& the horse and the hound and the horn that belonged to/;
    q
}
