#!/usr/bin/env bats
load bats-extra

@test 'Missed target' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='x: -9, y: 9'
    expected=0
    run sed -E -f darts.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'On the outer circle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='x: 0, y: 10'
    expected=1
    run sed -E -f darts.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'On the middle circle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='x: -5, y: 0'
    expected=5
    run sed -E -f darts.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'On the inner circle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='x: 0, y: -1'
    expected=10
    run sed -E -f darts.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Exactly on center' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='x: 0, y: 0'
    expected=10
    run sed -E -f darts.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Near the center' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='x: -0.1, y: -0.1'
    expected=10
    run sed -E -f darts.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Just within the inner circle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='x: 0.7, y: 0.7'
    expected=10
    run sed -E -f darts.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Just outside the inner circle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='x: 0.8, y: -0.8'
    expected=5
    run sed -E -f darts.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Just within the middle circle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='x: -3.5, y: 3.5'
    expected=5
    run sed -E -f darts.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Just outside the middle circle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='x: -3.6, y: -3.6'
    expected=1
    run sed -E -f darts.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Just within the outer circle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='x: -7.0, y: 7.0'
    expected=1
    run sed -E -f darts.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Just outside the outer circle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='x: 7.1, y: -7.1'
    expected=0
    run sed -E -f darts.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Asymmetric position between the inner and middle circles' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='x: 0.5, y: -4'
    expected=5
    run sed -E -f darts.sed <<< "$input"
    assert_success
    assert_output $expected
}
