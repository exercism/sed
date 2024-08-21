#!/usr/bin/env bats
load bats-extra

@test 'single bit one to decimal' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 2,
      "digits": [1],
      "outputBase": 10
    }'
    expected='[1]'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'binary to single decimal' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 2,
      "digits": [1, 0, 1],
      "outputBase": 10
    }'
    expected='[5]'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'single decimal to binary' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 10,
      "digits": [5],
      "outputBase": 2
    }'
    expected='[1, 0, 1]'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'binary to multiple decimal' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 2,
      "digits": [1, 0, 1, 0, 1, 0 ],
      "outputBase": 10
    }'
    expected='[4, 2]'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'decimal to binary' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 10,
      "digits": [4, 2],
      "outputBase": 2
    }'
    expected='[1, 0, 1, 0, 1, 0]'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'trinary to hexadecimal' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 3,
      "digits": [1, 1, 2, 0],
      "outputBase": 16
    }'
    expected='[2, 10]'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'hexadecimal to trinary' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 16,
      "digits": [2, 10],
      "outputBase": 3
    }'
    expected='[1, 1, 2, 0]'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test '15-bit integer' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 97,
      "digits": [3, 46, 60],
      "outputBase": 73
    }'
    expected='[6, 10, 45]'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'empty list' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 2,
      "digits": [],
      "outputBase": 10
    }'
    expected='[0]'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'single zero' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 10,
      "digits": [0],
      "outputBase": 2
    }'
    expected='[0]'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'multiple zeros' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 10,
      "digits": [0, 0, 0],
      "outputBase": 2
    }'
    expected='[0]'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'leading zeros' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 7,
      "digits": [0, 6, 0],
      "outputBase": 10
    }'
    expected='[4, 2]'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'input base is one' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 1,
      "digits": [0],
      "outputBase": 10
    }'
    expected='{"error":"input base must be >= 2"}'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'input base is zero' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 0,
      "digits": [],
      "outputBase": 10
    }'
    expected='{"error":"input base must be >= 2"}'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'input base is negative' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": -2,
      "digits": [1],
      "outputBase": 10
    }'
    expected='{"error":"input base must be >= 2"}'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'negative digit' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 2,
      "digits": [1, -1, 1, 0, 1, 0],
      "outputBase": 10
    }'
    expected='{"error":"all digits must satisfy 0 <= d < input base"}'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'invalid positive digit' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 2,
      "digits": [1, 2, 1, 0, 1, 0],
      "outputBase": 10
    }'
    expected='{"error":"all digits must satisfy 0 <= d < input base"}'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'output base is one' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 2,
      "digits": [1, 0, 1, 0, 1, 0],
      "outputBase": 1
    }'
    expected='{"error":"output base must be >= 2"}'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'output base is zero' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 10,
      "digits": [7],
      "outputBase": 0
    }'
    expected='{"error":"output base must be >= 2"}'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'output base is negative' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": 2,
      "digits": [1],
      "outputBase": -7
    }'
    expected='{"error":"output base must be >= 2"}'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'both bases are negative' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "rebase",
      "inputBase": -2,
      "digits": [1],
      "outputBase": -7
    }'
    expected='{"error":"input base must be >= 2"}'
    run sed -E -f all-your-base.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}
