#!/usr/bin/env bats
load bats-extra

@test 'first prime' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "prime", "nth-prime": 1'
    expected=2
    run sed -E -f nth-prime.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'second prime' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "prime", "nth-prime": 2'
    expected=3
    run sed -E -f nth-prime.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'sixth prime' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "prime", "nth-prime": 6'
    expected=13
    run sed -E -f nth-prime.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'there is no zeroth prime' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "prime", "nth-prime": 0'
    expected='there is no zeroth prime'
    run sed -E -f nth-prime.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'third prime' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "prime", "nth-prime": 3'
    expected=5
    run sed -E -f nth-prime.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'fifth prime' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "prime", "nth-prime": 5'
    expected=11
    run sed -E -f nth-prime.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'seventh prime' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "prime", "nth-prime": 7'
    expected=17
    run sed -E -f nth-prime.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'eleventh prime' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "prime", "nth-prime": 11'
    expected=31
    run sed -E -f nth-prime.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'fifty-nineth prime' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "prime", "nth-prime": 59'
    expected=277
    run sed -E -f nth-prime.sed <<< "$input"
    assert_success
    assert_output $expected
}
