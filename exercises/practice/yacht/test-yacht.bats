#!/usr/bin/env bats
load bats-extra

# The dice are represented always as a list of exactly five integers
# with values between 1 and 6 inclusive. The category is an string.
# the categories are 'ones' to 'sixes'.
# Then 'full house',
#      'four of a kind'
#      'little straight' 1-5
#      'big straight' 2-6
#      'choice', sometimes called Chance
#      'yacht', or five of a kind

@test 'Yacht' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [5, 5, 5, 5, 5], "category": "yacht"'
    expected=50
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Not Yacht' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [1, 3, 3, 2, 5], "category": "yacht"'
    expected=0
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Ones' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [1, 1, 1, 3, 5], "category": "ones"'
    expected=3
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Ones, out of order' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [3, 1, 1, 5, 1], "category": "ones"'
    expected=3
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'No ones' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [4, 3, 6, 5, 5], "category": "ones"'
    expected=0
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Twos' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [2, 3, 4, 5, 6], "category": "twos"'
    expected=2
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Fours' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [1, 4, 1, 4, 1], "category": "fours"'
    expected=8
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Yacht counted as threes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [3, 3, 3, 3, 3], "category": "threes"'
    expected=15
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Yacht of 3s counted as fives' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [3, 3, 3, 3, 3], "category": "fives"'
    expected=0
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Fives' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [1, 5, 3, 5, 3], "category": "fives"'
    expected=10
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Sixes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [2, 3, 4, 5, 6], "category": "sixes"'
    expected=6
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Full house two small, three big' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [2, 2, 4, 4, 4], "category": "full house"'
    expected=16
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Full house three small, two big' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [5, 3, 3, 5, 3], "category": "full house"'
    expected=19
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Two pair is not a full house' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [2, 2, 4, 4, 5], "category": "full house"'
    expected=0
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Four of a kind is not a full house' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [1, 4, 4, 4, 4], "category": "full house"'
    expected=0
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Yacht is not a full house' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [2, 2, 2, 2, 2], "category": "full house"'
    expected=0
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Four of a Kind' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [6, 6, 4, 6, 6], "category": "four of a kind"'
    expected=24
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Yacht can be scored as Four of a Kind' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [3, 3, 3, 3, 3], "category": "four of a kind"'
    expected=12
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Full house is not Four of a Kind' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [3, 3, 3, 5, 5], "category": "four of a kind"'
    expected=0
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Little Straight' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [3, 5, 4, 1, 2], "category": "little straight"'
    expected=30
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Little Straight as Big Straight' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [1, 2, 3, 4, 5], "category": "big straight"'
    expected=0
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Four in order but not a little straight' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [1, 1, 2, 3, 4], "category": "little straight"'
    expected=0
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'No pairs but not a little straight' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [1, 2, 3, 4, 6], "category": "little straight"'
    expected=0
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Minimum is 1, maximum is 5, but not a little straight' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [1, 1, 3, 4, 5], "category": "little straight"'
    expected=0
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Big Straight' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [4, 6, 2, 5, 3], "category": "big straight"'
    expected=30
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Big Straight as little straight' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [6, 5, 4, 3, 2], "category": "little straight"'
    expected=0
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'No pairs but not a big straight' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [6, 5, 4, 3, 1], "category": "big straight"'
    expected=0
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Choice' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [3, 3, 5, 6, 6], "category": "choice"'
    expected=23
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Yacht as choice' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "score", "dice": [2, 2, 2, 2, 2], "category": "choice"'
    expected=10
    run sed -E -f yacht.sed <<< "$input"
    assert_success
    assert_output $expected
}
