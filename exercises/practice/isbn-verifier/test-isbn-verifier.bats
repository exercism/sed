#!/usr/bin/env bats
load bats-extra

@test 'valid isbn' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "3-598-21508-8"}'
    expected='true'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'invalid isbn check digit' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "3-598-21508-9"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'valid isbn with a check digit of 10' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "3-598-21507-X"}'
    expected='true'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'check digit is a character other than X' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "3-598-21507-A"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'invalid check digit in isbn is not treated as zero' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "4-598-21507-B"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'invalid character in isbn is not treated as zero' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "3-598-P1581-X"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'X is only valid as a check digit' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "3-598-2X507-9"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'valid isbn without separating dashes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "3598215088"}'
    expected='true'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'isbn without separating dashes and X as check digit' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "359821507X"}'
    expected='true'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'isbn without check digit and dashes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "359821507"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'too long isbn and no dashes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "3598215078X"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'too short isbn' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "00"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'isbn without check digit' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "3-598-21507"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'check digit of X should not be used for 0' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "3-598-21515-X"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'empty isbn' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": ""}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'input is 9 characters' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "134456729"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'invalid characters are not ignored after checking length' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "3132P34035"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'invalid characters are not ignored before checking length' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    ## Catch invalid characters in an otherwise valid isbn
    input='{"property": "isValid", "isbn": "3598P215088"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'input is too long but contains a valid isbn' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property": "isValid", "isbn": "98245726788"}'
    expected='false'
    run sed -E -f isbn-verifier.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
