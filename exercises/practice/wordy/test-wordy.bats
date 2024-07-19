#!/usr/bin/env bats
load bats-extra

@test 'just a number' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 5?'
    expected=5
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'addition' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 1 plus 1?'
    expected=2
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'more addition' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 53 plus 2?'
    expected=55
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'addition with negative numbers' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is -1 plus -10?'
    expected=-11
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'large addition' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 123 plus 45678?'
    expected=45801
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'subtraction' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 4 minus -12?'
    expected=16
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'multiplication' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is -3 multiplied by 25?'
    expected=-75
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'division' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 33 divided by -3?'
    expected=-11
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'multiple additions' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 1 plus 1 plus 1?'
    expected=3
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'addition and subtraction' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 1 plus 5 minus -2?'
    expected=8
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'multiple subtraction' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 20 minus 4 minus 13?'
    expected=3
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'subtraction then addition' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 17 minus 6 plus 3?'
    expected=14
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'multiple multiplication' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 2 multiplied by -2 multiplied by 3?'
    expected=-12
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'addition and multiplication' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is -3 plus 7 multiplied by -2?'
    expected=-8
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'multiple division' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is -12 divided by 2 divided by -3?'
    expected=2
    run sed -E -f wordy.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'unknown operation' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 52 cubed?'
    expected='unknown operation'
    run sed -E -f wordy.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}
 
@test 'Non math question' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='Who is the President of the United States?'
    expected='unknown operation'
    run sed -E -f wordy.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'reject problem missing an operand' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 1 plus?'
    expected='syntax error'
    run sed -E -f wordy.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'reject problem with no operands or operators' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is?'
    expected='syntax error'
    run sed -E -f wordy.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'reject two operations in a row' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 1 plus plus 2?'
    expected='syntax error'
    run sed -E -f wordy.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'reject two numbers in a row' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 1 plus 2 1?'
    expected='syntax error'
    run sed -E -f wordy.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'reject postfix notation' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is 1 2 plus?'
    expected='syntax error'
    run sed -E -f wordy.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'reject prefix notation' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='What is plus 1 2?'
    expected='syntax error'
    run sed -E -f wordy.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}
