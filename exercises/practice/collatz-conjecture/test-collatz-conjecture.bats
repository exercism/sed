#!/usr/bin/env bats
load bats-extra

@test 'zero steps for one' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "steps", "number": 1'
    expected=0
    run sed -E -f collatz-conjecture.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'divide if even' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "steps", "number": 16'
    expected=4
    run sed -E -f collatz-conjecture.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'even and odd steps' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "steps", "number": 12'
    expected=9
    run sed -E -f collatz-conjecture.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'thirty-one steps' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "steps", "number": 172'
    expected=31
    run sed -E -f collatz-conjecture.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'thirty steps' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "steps", "number": 555'
    expected=30
    run sed -E -f collatz-conjecture.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'twenty-nine steps' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "steps", "number": 10000'
    expected=29
    run sed -E -f collatz-conjecture.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'zero is an error' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "steps", "number": 0'
    expected='Only integers greater than 1 are allowed'
    run sed -E -f collatz-conjecture.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'negative value is an error' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "steps", "number": -15'
    expected='Only integers greater than 1 are allowed'
    run sed -E -f collatz-conjecture.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}
