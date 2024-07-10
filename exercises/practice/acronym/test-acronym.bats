#!/usr/bin/env bats
load bats-extra

@test 'basic' {
    run sed -E -f acronym.sed <<< "Portable Network Graphics"
    assert_success
    expected='PNG'
    assert_equal "$output" "$expected"
}

@test 'lowercase words' {
    run sed -E -f acronym.sed <<< "Ruby on Rails"
    assert_success
    expected='ROR'
    assert_equal "$output" "$expected"
}

@test 'punctuation' {
    run sed -E -f acronym.sed <<< "First In, First Out"
    assert_success
    expected='FIFO'
    assert_equal "$output" "$expected"
}

@test 'all caps word' {
    run sed -E -f acronym.sed <<< "GNU Image Manipulation Program"
    assert_success
    expected='GIMP'
    assert_equal "$output" "$expected"
}

@test 'punctuation without whitespace' {
    run sed -E -f acronym.sed <<< "Complementary metal-oxide semiconductor"
    assert_success
    expected='CMOS'
    assert_equal "$output" "$expected"
}

@test 'very long abbreviation' {
    run sed -E -f acronym.sed <<< "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"
    assert_success
    expected='ROTFLSHTMDCOALM'
    assert_equal "$output" "$expected"
}

@test 'consecutive delimiters' {
    run sed -E -f acronym.sed <<< "Something - I made up from thin air"
    assert_success
    expected='SIMUFTA'
    assert_equal "$output" "$expected"
}

@test 'apostrophes' {
    run sed -E -f acronym.sed <<< "Halley's Comet"
    assert_success
    expected='HC'
    assert_equal "$output" "$expected"
}

@test 'underscore emphasis' {
    run sed -E -f acronym.sed <<< "The Road _Not_ Taken"
    assert_success
    expected='TRNT'
    assert_equal "$output" "$expected"
}
