#!/usr/bin/env bats
load bats-extra

@test 'root of 1' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "squareRoot", "radicand": 1'
    expected=1
    run sed -E -f square-root.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'root of 4' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "squareRoot", "radicand": 4'
    expected=2
    run sed -E -f square-root.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'root of 25' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "squareRoot", "radicand": 25'
    expected=5
    run sed -E -f square-root.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'root of 49' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "squareRoot", "radicand": 49'
    expected=7
    run sed -E -f square-root.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'root of 81' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "squareRoot", "radicand": 81'
    expected=9
    run sed -E -f square-root.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'root of 121' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "squareRoot", "radicand": 121'
    expected=11
    run sed -E -f square-root.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'root of 196' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "squareRoot", "radicand": 196'
    expected=14
    run sed -E -f square-root.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'root of 289' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "squareRoot", "radicand": 289'
    expected=17
    run sed -E -f square-root.sed <<< "$input"
    assert_success
    assert_output $expected
}
