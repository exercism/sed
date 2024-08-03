#!/usr/bin/env bats
load bats-extra

## verse
@test 'first day a partridge in a pear tree' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 1, "endVerse": 1'
    expected='On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.'
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'second day two turtle doves' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 2, "endVerse": 2'
    expected='On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.'
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'third day three french hens' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 3, "endVerse": 3'
    expected='On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'fourth day four calling birds' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 4, "endVerse": 4'
    expected='On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'fifth day five gold rings' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 5, "endVerse": 5'
    expected='On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'sixth day six geese-a-laying' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 6, "endVerse": 6'
    expected='On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'seventh day seven swans-a-swimming' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 7, "endVerse": 7'
    expected='On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'eighth day eight maids-a-milking' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 8, "endVerse": 8'
    expected='On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'ninth day nine ladies dancing' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 9, "endVerse": 9'
    expected='On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'tenth day ten lords-a-leaping' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 10, "endVerse": 10'
    expected='On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'eleventh day eleven pipers piping' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 11, "endVerse": 11'
    expected='On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'twelfth day twelve drummers drumming' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 12, "endVerse": 12'
    expected='On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

## lyrics
@test 'recites first three verses of the song' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 1, "endVerse": 3'
    expected="$(cat <<EOT
On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.
On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.
On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
EOT
    )"
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'recites three verses from the middle of the song' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 4, "endVerse": 6'
    expected="$(cat <<EOT
On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
EOT
    )"
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'recites the whole song' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "recite", "startVerse": 1, "endVerse": 12'
    expected="$(cat <<EOT
On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.
On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.
On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.
EOT
    )"
    run sed -E -f twelve-days.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
