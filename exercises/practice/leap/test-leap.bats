#!/usr/bin/env bats
load bats-extra

@test 'year not divisible by 4 in common year' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='year: 2015'
    expected='false'
    run sed -E -f leap.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'year divisible by 2, not divisible by 4 in common year' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='year: 1970'
    expected='false'
    run sed -E -f leap.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'year divisible by 4, not divisible by 100 in leap year' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='year: 1996'
    expected='true'
    run sed -E -f leap.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'year divisible by 4 and 5 is still a leap year' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='year: 1960'
    expected='true'
    run sed -E -f leap.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'year divisible by 100, not divisible by 400 in common year' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='year: 2100'
    expected='false'
    run sed -E -f leap.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'year divisible by 100 but not by 3 is still not a leap year' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='year: 1900'
    expected='false'
    run sed -E -f leap.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'year divisible by 400 is leap year' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='year: 2000'
    expected='true'
    run sed -E -f leap.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'year divisible by 400 but not by 125 is still a leap year' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='year: 2400'
    expected='true'
    run sed -E -f leap.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'year divisible by 200, not divisible by 400 in common year' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='year: 1800'
    expected='false'
    run sed -E -f leap.sed <<< "$input"
    assert_success
    assert_output $expected
}
