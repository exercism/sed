#!/usr/bin/env bats
load bats-extra

@test "1 is a single I" {
    run sed -E -f roman-numerals.sed <<< 1
    assert_success
    assert_output "I"
}

@test "2 is two I's" {
    run sed -E -f roman-numerals.sed <<< 2
    assert_success
    assert_output "II"
}

@test "3 is three I's" {
    run sed -E -f roman-numerals.sed <<< 3
    assert_success
    assert_output "III"
}

@test "4, being 5 - 1, is IV" {
    run sed -E -f roman-numerals.sed <<< 4
    assert_success
    assert_output "IV"
}

@test "5 is a single V" {
    run sed -E -f roman-numerals.sed <<< 5
    assert_success
    assert_output "V"
}

@test "6, being 5 + 1, is VI" {
    run sed -E -f roman-numerals.sed <<< 6
    assert_success
    assert_output "VI"
}

@test "9, being 10 - 1, is IX" {
    run sed -E -f roman-numerals.sed <<< 9
    assert_success
    assert_output "IX"
}

@test "20 is two X's" {
    run sed -E -f roman-numerals.sed <<< 27
    assert_success
    assert_output "XXVII"
}

@test "48 is not 50 - 2 but rather 40 + 8" {
    run sed -E -f roman-numerals.sed <<< 48
    assert_success
    assert_output "XLVIII"
}

@test "49 is not 40 + 5 + 4 but rather 50 - 10 + 10 - 1" {
    run sed -E -f roman-numerals.sed <<< 49
    assert_success
    assert_output "XLIX"
}

@test "50 is a single L" {
    run sed -E -f roman-numerals.sed <<< 59
    assert_success
    assert_output "LIX"
}

@test "90, being 100 - 10, is XC" {
    run sed -E -f roman-numerals.sed <<< 93
    assert_success
    assert_output "XCIII"
}

@test "100 is a single C" {
    run sed -E -f roman-numerals.sed <<< 141
    assert_success
    assert_output "CXLI"
}

@test "60, being 50 + 10, is LX" {
    run sed -E -f roman-numerals.sed <<< 163
    assert_success
    assert_output "CLXIII"
}

@test "400, being 500 - 100, is CD" {
    run sed -E -f roman-numerals.sed <<< 402
    assert_success
    assert_output "CDII"
}

@test "500 is a single D" {
    run sed -E -f roman-numerals.sed <<< 575
    assert_success
    assert_output "DLXXV"
}

@test "900, being 1000 - 100, is CM" {
    run sed -E -f roman-numerals.sed <<< 911
    assert_success
    assert_output "CMXI"
}

@test "1000 is a single M" {
    run sed -E -f roman-numerals.sed <<< 1024
    assert_success
    assert_output "MXXIV"
}

@test "3000 is three M's" {
    run sed -E -f roman-numerals.sed <<< 3000
    assert_success
    assert_output "MMM"
}

@test "3001 is three MMMI" {
    run sed -E -f roman-numerals.sed <<< 3001
    assert_success
    assert_output "MMMI"
}

@test "3999 is three MMMCMXCIX" {
    run sed -E -f roman-numerals.sed <<< 3999
    assert_success
    assert_output "MMMCMXCIX"
}

@test "16 is XVI" {
    run sed -E -f roman-numerals.sed <<< 16
    assert_success
    assert_output "XVI"
}

@test "66 is LXVI" {
    run sed -E -f roman-numerals.sed <<< 66
    assert_success
    assert_output "LXVI"
}

@test "166 is CLXVI" {
    run sed -E -f roman-numerals.sed <<< 166
    assert_success
    assert_output "CLXVI"
}

@test "666 is DCLXVI" {
    run sed -E -f roman-numerals.sed <<< 666
    assert_success
    assert_output "DCLXVI"
}

@test "1666 is MDCLXVI" {
    run sed -E -f roman-numerals.sed <<< 1666
    assert_success
    assert_output "MDCLXVI"
}

@test "3888 is MMMDCCCLXXXVIII" {
    run sed -E -f roman-numerals.sed <<< 3888
    assert_success
    assert_output "MMMDCCCLXXXVIII"
}
