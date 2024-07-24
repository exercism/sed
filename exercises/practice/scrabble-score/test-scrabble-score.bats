#!/usr/bin/env bats
load bats-extra

@test 'lowercase letter' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='word: a'
    expected=1
    run sed -E -f scrabble-score.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'uppercase letter' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='word: A'
    expected=1
    run sed -E -f scrabble-score.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'valuable letter' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='word: f'
    expected=4
    run sed -E -f scrabble-score.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'short word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='word: at'
    expected=2
    run sed -E -f scrabble-score.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'short, valuable word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='word: zoo'
    expected=12
    run sed -E -f scrabble-score.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'medium word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='word: street'
    expected=6
    run sed -E -f scrabble-score.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'medium, valuable word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='word: quirky'
    expected=22
    run sed -E -f scrabble-score.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'long, mixed-case word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='word: OxyphenButazone'
    expected=41
    run sed -E -f scrabble-score.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'english-like word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='word: pinata'
    expected=8
    run sed -E -f scrabble-score.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'empty input' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='word: '
    expected=0
    run sed -E -f scrabble-score.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'entire alphabet available' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='word: abcdefghijklmnopqrstuvwxyz'
    expected=87
    run sed -E -f scrabble-score.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
