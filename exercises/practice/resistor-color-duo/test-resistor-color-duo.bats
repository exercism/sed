#!/usr/bin/env bats
load bats-extra

@test 'brown black' {
    run sed -E -f resistor-color-duo.sed <<< 'brown black'
    assert_success
    assert_output '10'
}

@test 'blue grey' {
    run sed -E -f resistor-color-duo.sed <<< 'blue grey'
    assert_success
    assert_output '68'
}

@test 'yellow violet' {
    run sed -E -f resistor-color-duo.sed <<< 'yellow violet'
    assert_success
    assert_output '47'
}

@test 'white red' {
    run sed -E -f resistor-color-duo.sed <<< 'white red'
    assert_success
    assert_output '92'
}

@test 'orange orange' {
    run sed -E -f resistor-color-duo.sed <<< 'orange orange'
    assert_success
    assert_output '33'
}

@test 'invalid color' {
    run sed -E -f resistor-color-duo.sed <<< 'foo'
    assert_failure
    assert_output --partial 'invalid color'
}

@test 'ignore too many colors' {
    run sed -E -f resistor-color-duo.sed <<< 'green brown orange'
    assert_success
    assert_output '51'
}

@test 'black brown' {
    run sed -E -f resistor-color-duo.sed <<< 'black brown'
    assert_success
    assert_output '1'
}

@test 'black grey' {
    run sed -E -f resistor-color-duo.sed <<< 'black grey'
    assert_success
    assert_output '8'
}
