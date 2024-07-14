#!/usr/bin/env bats
load bats-extra

@test 'black' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color.sed <<< 'black'
    assert_success
    assert_output '0'
}

@test 'brown' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color.sed <<< 'brown'
    assert_success
    assert_output '1'
}

@test 'red' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color.sed <<< 'red'
    assert_success
    assert_output '2'
}

@test 'orange' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color.sed <<< 'orange'
    assert_success
    assert_output '3'
}

@test 'yellow' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color.sed <<< 'yellow'
    assert_success
    assert_output '4'
}

@test 'green' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color.sed <<< 'green'
    assert_success
    assert_output '5'
}

@test 'blue' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color.sed <<< 'blue'
    assert_success
    assert_output '6'
}

@test 'violet' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color.sed <<< 'violet'
    assert_success
    assert_output '7'
}

@test 'grey' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color.sed <<< 'grey'
    assert_success
    assert_output '8'
}

@test 'white' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color.sed <<< 'white'
    assert_success
    assert_output '9'
}

@test 'invalid color' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color.sed <<< 'foo'
    assert_failure
    assert_output --partial 'invalid color'
}

@test 'ignore too many colors' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f resistor-color.sed <<< 'black brown'
    assert_success
    assert_output '0'
}

@test 'list all colors and values' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END_EXPECTED
black: 0
brown: 1
red: 2
orange: 3
yellow: 4
green: 5
blue: 6
violet: 7
grey: 8
white: 9
END_EXPECTED
)
    run sed -E -f resistor-color.sed <<< ''
    assert_success
    assert_output "$expected"
}
