#!/usr/bin/env bats
load bats-extra

@test 'empty sentence' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f pangram.sed <<< ''
    assert_success
    expected=false
    assert_equal "$output" "$expected"
}

@test 'perfect lower case' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f pangram.sed <<< 'abcdefghijklmnopqrstuvwxyz'
    assert_success
    expected=true
    assert_equal "$output" "$expected"
}

@test 'only lower case' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f pangram.sed <<< 'the quick brown fox jumps over the lazy dog'
    assert_success
    expected=true
    assert_equal "$output" "$expected"
}

@test 'missing the letter "x"' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f pangram.sed <<< 'a quick movement of the enemy will jeopardize five gunboats'

    assert_success
    expected=false
    assert_equal "$output" "$expected"
}

@test 'missing the letter "h"' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f pangram.sed <<< 'five boxing wizards jump quickly at it'
    assert_success
    expected=false
    assert_equal "$output" "$expected"
}

@test 'with underscores' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f pangram.sed <<< 'the_quick_brown_fox_jumps_over_the_lazy_dog'
    assert_success
    expected=true
    assert_equal "$output" "$expected"
}

@test 'with numbers' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f pangram.sed <<< 'the 1 quick brown fox jumps over the 2 lazy dogs'
    assert_success
    expected=true
    assert_equal "$output" "$expected"
}

@test 'missing letters replaced by numbers' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f pangram.sed <<< '7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'
    assert_success
    expected=false
    assert_equal "$output" "$expected"
}

@test 'mixed case and punctuation' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f pangram.sed <<< '"Five quacking Zephyrs jolt my wax bed."'
    assert_success
    expected=true
    assert_equal "$output" "$expected"
}

@test 'a-m and A-M are 26 different characters but not a pangram' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f pangram.sed <<< 'abcdefghijklm ABCDEFGHIJKLM'
    assert_success
    expected=false
    assert_equal "$output" "$expected"
}
