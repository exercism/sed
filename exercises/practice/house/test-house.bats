#!/usr/bin/env bats
load bats-extra

@test 'verse one - the house that jack built' {
    start_verse=1
    end_verse=1
    input="$start_verse $end_verse"
    expected='This is the house that Jack built.'
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'verse two - the malt that lay' {
    start_verse=2
    end_verse=2
    input="$start_verse $end_verse"
    expected='This is the malt that lay in the house that Jack built.'
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'verse three - the rat that ate' {
    start_verse=3
    end_verse=3
    input="$start_verse $end_verse"
    expected='This is the rat that ate the malt that lay in the house that Jack built.'
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'verse four - the cat that killed' {
    start_verse=4
    end_verse=4
    input="$start_verse $end_verse"
    expected='This is the cat that killed the rat that ate the malt that lay in the house that Jack built.'
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'verse five - the dog that worried' {
    start_verse=5
    end_verse=5
    input="$start_verse $end_verse"
    expected='This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.'
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'verse six - the cow with the crumpled horn' {
    start_verse=6
    end_verse=6
    input="$start_verse $end_verse"
    expected='This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.'
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'verse seven - the maiden all forlorn' {
    start_verse=7
    end_verse=7
    input="$start_verse $end_verse"
    expected='This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.'
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'verse eight - the man all tattered and torn' {
    start_verse=8
    end_verse=8
    input="$start_verse $end_verse"
    expected='This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.'
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'verse nine - the priest all shaven and shorn' {
    start_verse=9
    end_verse=9
    input="$start_verse $end_verse"
    expected='This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.'
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'verse ten - the rooster that crowed in the morn' {
    start_verse=10
    end_verse=10
    input="$start_verse $end_verse"
    expected='This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.'
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'verse eleven - the farmer sowing his corn' {
    start_verse=11
    end_verse=11
    input="$start_verse $end_verse"
    expected='This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.'
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'verse twelve - the horse and the hound and the horn' {
    start_verse=12
    end_verse=12
    input="$start_verse $end_verse"
    expected='This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.'
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'multiple verses' {
    start_verse=4
    end_verse=8
    input="$start_verse $end_verse"
    expected="$(cat <<EOT
This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
EOT
)"
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'full rhyme' {
    start_verse=1
    end_verse=12
    input="$start_verse $end_verse"
    expected="$(cat <<EOT
This is the house that Jack built.
This is the malt that lay in the house that Jack built.
This is the rat that ate the malt that lay in the house that Jack built.
This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
EOT
)"
    run sed -E -f house.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
