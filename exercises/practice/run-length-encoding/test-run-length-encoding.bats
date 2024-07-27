#!/usr/bin/env bats
load bats-extra

@test 'encode: empty string' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "encode", "string": ""'
    expected=''
    run sed -E -f run-length-encoding.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'encode: single characters only are encoded without count' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "encode", "string": "XYZ"'
    expected='XYZ'
    run sed -E -f run-length-encoding.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'encode: string with no single characters' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "encode", "string": "AABBBCCCC"'
    expected='2A3B4C'
    run sed -E -f run-length-encoding.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'encode: single characters mixed with repeated characters' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "encode", "string": "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"'
    expected='12WB12W3B24WB'
    run sed -E -f run-length-encoding.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'encode: multiple whitespace mixed in string' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "encode", "string": "  hsqq qww  "'
    expected='2 hs2q q2w2 '
    run sed -E -f run-length-encoding.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'encode: lowercase characters' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "encode", "string": "aabbbcccc"'
    expected='2a3b4c'
    run sed -E -f run-length-encoding.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'decode: empty string' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "decode", "string": ""'
    expected=''
    run sed -E -f run-length-encoding.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'decode: single characters only' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "decode", "string": "XYZ"'
    expected='XYZ'
    run sed -E -f run-length-encoding.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'decode: string with no single characters' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "decode", "string": "2A3B4C"'
    expected='AABBBCCCC'
    run sed -E -f run-length-encoding.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'decode: single characters with repeated characters' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "decode", "string": "12WB12W3B24WB"'
    expected='WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB'
    run sed -E -f run-length-encoding.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'decode: multiple whitespace mixed in string' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "decode", "string": "2 hs2q q2w2 "'
    expected='  hsqq qww  '
    run sed -E -f run-length-encoding.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'decode: lowercase string' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "decode", "string": "2a3b4c"'
    expected='aabbbcccc'
    run sed -E -f run-length-encoding.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
