#!/usr/bin/env bats
load bats-extra

@test 'an empty string' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f reverse-string.sed <<< ''
    assert_success
    assert_output ''
}

@test 'a word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f reverse-string.sed <<< 'robot'
    assert_success
    assert_output 'tobor'
}

@test 'a capitalised word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f reverse-string.sed <<< 'Ramen'
    assert_success
    assert_output 'nemaR'
}

@test 'a sentence with punctuation' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f reverse-string.sed <<< "I'm hungry!"
    assert_success
    assert_output "!yrgnuh m'I"
}

@test 'a palindrome' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f reverse-string.sed <<< 'racecar'
    assert_success
    assert_output 'racecar'
}

@test 'an even-sized word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f reverse-string.sed <<< 'drawer'
    assert_success
    assert_output 'reward'
}
