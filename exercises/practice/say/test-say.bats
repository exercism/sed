#!/usr/bin/env bats
load bats-extra

@test zero {
    run sed -E -f say.sed <<< 0
    assert_success
    assert_output 'zero'
}

@test one {
    run sed -E -f say.sed <<< 1
    assert_success
    assert_output 'one'
}

@test fourteen {
    run sed -E -f say.sed <<< 14
    assert_success
    assert_output 'fourteen'
}

@test twenty {
    run sed -E -f say.sed <<< 20
    assert_success
    assert_output 'twenty'
}

@test 'twenty-two' {
    run sed -E -f say.sed <<< 22
    assert_success
    assert_output 'twenty-two'
}

@test thirty {
    run sed -E -f say.sed <<< 30
    assert_success
    assert_output 'thirty'
}

@test 'ninety-nine' {
    run sed -E -f say.sed <<< 99
    assert_success
    assert_output 'ninety-nine'
}

@test 'one hundred' {
    run sed -E -f say.sed <<< 100
    assert_success
    assert_output 'one hundred'
}

@test 'one hundred twenty-three' {
    run sed -E -f say.sed <<< 123
    assert_success
    assert_output 'one hundred twenty-three'
}

@test 'two hundred' {
    run sed -E -f say.sed <<< 200
    assert_success
    assert_output 'two hundred'
}

@test 'nine hundred ninety-nine' {
    run sed -E -f say.sed <<< 999
    assert_success
    assert_output 'nine hundred ninety-nine'
}

@test 'one thousand' {
    run sed -E -f say.sed <<< 1000
    assert_success
    assert_output 'one thousand'
}

@test 'one thousand two hundred thirty-four' {
    run sed -E -f say.sed <<< 1234
    assert_success
    assert_output 'one thousand two hundred thirty-four'
}

@test 'one million' {
    run sed -E -f say.sed <<< 1000000
    assert_success
    assert_output 'one million'
}

@test 'one million two thousand three hundred forty-five' {
    run sed -E -f say.sed <<< 1002345
    assert_success
    assert_output 'one million two thousand three hundred forty-five'
}

@test 'one billion' {
    run sed -E -f say.sed <<< 1000000000
    assert_success
    assert_output 'one billion'
}

@test 'a big number' {
    run sed -E -f say.sed <<< 987654321123
    assert_success
    assert_output 'nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three'
}

@test 'numbers below zero are out of range' {
    run sed -E -f say.sed <<< -1
    assert_failure
    assert_output 'input out of range'
}

@test 'numbers above 999,999,999,999 are out of range' {
    run sed -E -f say.sed <<< 1000000000000
    assert_failure
    assert_output 'input out of range'
}
