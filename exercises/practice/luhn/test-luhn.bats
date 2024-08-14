#!/usr/bin/env bats
load bats-extra

@test 'single digit strings can not be valid' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "1" }'
    expected='false'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'a single zero is invalid' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "0" }'
    expected='false'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'a simple valid SIN that remains valid if reversed' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "059" }'
    expected='true'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'a simple valid SIN that becomes invalid if reversed' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "59" }'
    expected='true'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'a valid Canadian SIN' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "055 444 285" }'
    expected='true'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'invalid Canadian SIN' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "055 444 286" }'
    expected='false'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'invalid credit card' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "8273 1232 7352 0569" }'
    expected='false'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'invalid long number with an even remainder' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "1 2345 6789 1234 5678 9012" }'
    expected='false'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'invalid long number with a remainder divisible by 5' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "1 2345 6789 1234 5678 9013" }'
    expected='false'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'valid number with an even number of digits' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "095 245 88" }'
    expected='true'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'valid number with an odd number of spaces' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "234 567 891 234" }'
    expected='true'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'valid strings with a non-digit added at the end become invalid' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "059a" }'
    expected='false'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'valid strings with punctuation included become invalid' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "055-444-285" }'
    expected='false'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'valid strings with symbols included become invalid' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "055# 444$ 285" }'
    expected='false'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'single zero with space is invalid' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": " 0" }'
    expected='false'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'more than a single zero is valid' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "0000 0" }'
    expected='true'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'input digit 9 is correctly converted to output digit 9' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "091" }'
    expected='true'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'very long input is valid' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    ## Designed to prevent converting input to a single number as this
    ## approach can risk an overflow.
    input='{
      "property": "valid",
      "value": "9999999999 9999999999 9999999999 9999999999"
    }'
    expected='true'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'valid luhn with an odd number of digits and non zero first digit' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "109" }'
    expected='true'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "using ascii value for non-doubled non-digit isn't allowed" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    ## Convert non-digits to their ascii values and then offset them by 48
    ## sometimes accidentally declare an invalid string to be valid.
    ## This test is designed to avoid that solution.
    input='{ "property": "valid", "value": "055b 444 285" }'
    expected='false'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "using ascii value for doubled non-digit isn't allowed" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    ## Convert non-digits to their ascii values and then offset them by 48
    ## sometimes accidentally declare an invalid string to be valid.
    ## This test is designed to avoid that solution.
    input='{ "property": "valid", "value": ":9" }'
    expected='false'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "valid", "value": "59%59" }'
    expected='false'
    run sed -E -f luhn.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
