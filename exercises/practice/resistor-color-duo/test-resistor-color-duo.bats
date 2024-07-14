#!/usr/bin/env bats
load bats-extra

@test 'brown black' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color-duo.sed <<< 'brown black'
    assert_success
    assert_output '10'
}

@test 'blue grey' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color-duo.sed <<< 'blue grey'
    assert_success
    assert_output '68'
}

@test 'yellow violet' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color-duo.sed <<< 'yellow violet'
    assert_success
    assert_output '47'
}

@test 'white red' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color-duo.sed <<< 'white red'
    assert_success
    assert_output '92'
}

@test 'orange orange' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color-duo.sed <<< 'orange orange'
    assert_success
    assert_output '33'
}

@test 'invalid color' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color-duo.sed <<< 'foo'
    assert_failure
    assert_output --partial 'invalid color'
}

@test 'ignore too many colors' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color-duo.sed <<< 'green brown orange'
    assert_success
    assert_output '51'
}

@test 'black brown' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color-duo.sed <<< 'black brown'
    assert_success
    assert_output '1'
}

@test 'black grey' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color-duo.sed <<< 'black grey'
    assert_success
    assert_output '8'
}
