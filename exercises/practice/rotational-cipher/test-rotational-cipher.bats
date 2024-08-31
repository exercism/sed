#!/usr/bin/env bats
load bats-extra

@test 'rotate a by 0, same output as input' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rotate",
      "text": "a",
      "shiftKey": 0
    }'
    expected="a"
    run sed -E -f rotational-cipher.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'rotate a by 1' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rotate",
      "text": "a",
      "shiftKey": 1
    }'
    expected="b"
    run sed -E -f rotational-cipher.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'rotate a by 26, same output as input' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rotate",
      "text": "a",
      "shiftKey": 26
    }'
    expected="a"
    run sed -E -f rotational-cipher.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'rotate m by 13' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rotate",
      "text": "m",
      "shiftKey": 13
    }'
    expected="z"
    run sed -E -f rotational-cipher.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'rotate n by 13 with wrap around alphabet' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rotate",
      "text": "n",
      "shiftKey": 13
    }'
    expected="a"
    run sed -E -f rotational-cipher.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'rotate capital letters' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rotate",
      "text": "OMG",
      "shiftKey": 5
    }'
    expected="TRL"
    run sed -E -f rotational-cipher.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'rotate spaces' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rotate",
      "text": "O M G",
      "shiftKey": 5
    }'
    expected="T R L"
    run sed -E -f rotational-cipher.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'rotate numbers' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rotate",
      "text": "Testing 1 2 3 testing",
      "shiftKey": 4
    }'
    expected="Xiwxmrk 1 2 3 xiwxmrk"
    run sed -E -f rotational-cipher.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'rotate punctuation' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
        "property": "rotate",
        "text": "Let'\''s eat, Grandma!",
        "shiftKey": 21
    }'
    expected="Gzo'n zvo, Bmviyhv!"
    run sed -E -f rotational-cipher.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'rotate all letters' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
        "property": "rotate",
        "text": "The quick brown fox jumps over the lazy dog.",
        "shiftKey": 13
    }'
    expected="Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
    run sed -E -f rotational-cipher.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
