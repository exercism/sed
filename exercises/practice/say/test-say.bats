#!/usr/bin/env bats
load bats-extra

@test zero {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 0
    assert_success
    assert_output 'zero'
}

@test one {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 1
    assert_success
    assert_output 'one'
}

@test fourteen {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 14
    assert_success
    assert_output 'fourteen'
}

@test twenty {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 20
    assert_success
    assert_output 'twenty'
}

@test 'twenty-two' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 22
    assert_success
    assert_output 'twenty-two'
}

@test thirty {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 30
    assert_success
    assert_output 'thirty'
}

@test 'ninety-nine' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 99
    assert_success
    assert_output 'ninety-nine'
}

@test 'one hundred' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 100
    assert_success
    assert_output 'one hundred'
}

@test 'one hundred twenty-three' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 123
    assert_success
    assert_output 'one hundred twenty-three'
}

@test 'two hundred' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 200
    assert_success
    assert_output 'two hundred'
}

@test 'nine hundred ninety-nine' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 999
    assert_success
    assert_output 'nine hundred ninety-nine'
}

@test 'one thousand' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 1000
    assert_success
    assert_output 'one thousand'
}

@test 'one thousand two hundred thirty-four' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 1234
    assert_success
    assert_output 'one thousand two hundred thirty-four'
}

@test 'one million' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 1000000
    assert_success
    assert_output 'one million'
}

@test 'one million two thousand three hundred forty-five' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 1002345
    assert_success
    assert_output 'one million two thousand three hundred forty-five'
}

@test 'one billion' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 1000000000
    assert_success
    assert_output 'one billion'
}

@test 'a big number' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 987654321123
    assert_success
    assert_output 'nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three'
}

@test 'numbers below zero are out of range' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< -1
    assert_failure
    assert_output 'input out of range'
}

@test 'numbers above 999,999,999,999 are out of range' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f say.sed <<< 1000000000000
    assert_failure
    assert_output 'input out of range'
}
