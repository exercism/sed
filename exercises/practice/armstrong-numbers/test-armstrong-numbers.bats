#!/usr/bin/env bats
load bats-extra

@test 'Zero is an Armstrong number' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=0
    expected='true'
    run sed -E -f armstrong-numbers.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Single-digit numbers are Armstrong numbers' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=5
    expected='true'
    run sed -E -f armstrong-numbers.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'There are no two-digit Armstrong numbers' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=10
    expected='false'
    run sed -E -f armstrong-numbers.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Three-digit number that is an Armstrong number' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=153
    expected='true'
    run sed -E -f armstrong-numbers.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Three-digit number that is not an Armstrong number' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=100
    expected='false'
    run sed -E -f armstrong-numbers.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Four-digit number that is an Armstrong number' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=9474
    expected='true'
    run sed -E -f armstrong-numbers.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'Four-digit number that is not an Armstrong number' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=9475
    expected='false'
    run sed -E -f armstrong-numbers.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'number: 1' {
    input=1
    expected=true
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 2' {
    input=2
    expected=true
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 3' {
    input=3
    expected=true
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 4' {
    input=4
    expected=true
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 6' {
    input=6
    expected=true
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 7' {
    input=7
    expected=true
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 8' {
    input=8
    expected=true
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 9' {
    input=9
    expected=true
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 370' {
    input=370
    expected=true
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 371' {
    input=371
    expected=true
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 407' {
    input=407
    expected=true
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 1634' {
    input=1634
    expected=true
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 8208' {
    input=8208
    expected=true
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 1214' {
    input=1214
    expected=false
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 1035' {
    input=1035
    expected=false
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 1149' {
    input=1149
    expected=false
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 1506' {
    input=1506
    expected=false
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 136' {
    input=136
    expected=false
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 352' {
    input=352
    expected=false
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 1327' {
    input=1327
    expected=false
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 19' {
    input=19
    expected=false
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 1810' {
    input=1810
    expected=false
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'number: 1967' {
    input=1967
    expected=false
    run sed -E -f armstrong-numbers.sed <<< $input
    assert_success
    assert_output $expected
}
