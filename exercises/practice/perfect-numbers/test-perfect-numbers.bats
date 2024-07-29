#!/usr/bin/env bats
load bats-extra

## Perfect numbers
@test 'Smallest perfect number is classified correctly' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "classify", "number": 6'
    expected='perfect'
    run sed -E -f perfect-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Medium perfect number is classified correctly' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "classify", "number": 28'
    expected='perfect'
    run sed -E -f perfect-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Next perfect number is classified correctly' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "classify", "number": 496'
    expected='perfect'
    run sed -E -f perfect-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

## Abundant numbers
@test 'Smallest abundant number is classified correctly' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "classify", "number": 12'
    expected='abundant'
    run sed -E -f perfect-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Medium abundant number is classified correctly' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "classify", "number": 30'
    expected='abundant'
    run sed -E -f perfect-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Next abundant number is classified correctly' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "classify", "number": 36'
    expected='abundant'
    run sed -E -f perfect-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

## Deficient numbers
@test 'Smallest prime deficient number is classified correctly' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "classify", "number": 2'
    expected='deficient'
    run sed -E -f perfect-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Smallest non-prime deficient number is classified correctly' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "classify", "number": 4'
    expected='deficient'
    run sed -E -f perfect-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Medium deficient number is classified correctly' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "classify", "number": 32'
    expected='deficient'
    run sed -E -f perfect-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Next deficient number is classified correctly' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "classify", "number": 33'
    expected='deficient'
    run sed -E -f perfect-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Edge case (no factors other than itself) is classified correctly' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "classify", "number": 1'
    expected='deficient'
    run sed -E -f perfect-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

## Invalid inputs
@test 'Zero is rejected (as it is not a positive integer)' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "classify", "number": 0'
    expected='Classification is only possible for positive integers.'
    run sed -E -f perfect-numbers.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'Negative integer is rejected (as it is not a positive integer)' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "classify", "number": -1'
    expected='Classification is only possible for positive integers.'
    run sed -E -f perfect-numbers.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}
