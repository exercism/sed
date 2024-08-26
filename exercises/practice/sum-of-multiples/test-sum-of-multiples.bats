#!/usr/bin/env bats
load bats-extra

@test 'no multiples within limit' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "sum", "factors": [3, 5], "limit": 1 }'
    expected=0
    run sed -E -f sum-of-multiples.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'one factor has multiples within limit' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "sum", "factors": [3, 5], "limit": 4 }'
    expected=3
    run sed -E -f sum-of-multiples.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'more than one multiple within limit' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "sum", "factors": [3], "limit": 7 }'
    expected=9
    run sed -E -f sum-of-multiples.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'more than one factor with multiples within limit' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "sum", "factors": [3, 5], "limit": 10 }'
    expected=23
    run sed -E -f sum-of-multiples.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'each multiple is only counted once' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "sum", "factors": [3, 5], "limit": 100 }'
    expected=2318
    run sed -E -f sum-of-multiples.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'three factors' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "sum", "factors": [7, 13, 17], "limit": 20 }'
    expected=51
    run sed -E -f sum-of-multiples.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'factors not relatively prime' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "sum", "factors": [4, 6], "limit": 15 }'
    expected=30
    run sed -E -f sum-of-multiples.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'some pairs of factors relatively prime and some not' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "sum", "factors": [5, 6, 8], "limit": 150 }'
    expected=4419
    run sed -E -f sum-of-multiples.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'one factor is a multiple of another' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "sum", "factors": [5, 25], "limit": 51 }'
    expected=275
    run sed -E -f sum-of-multiples.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'all numbers are multiples of 1' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "sum", "factors": [1], "limit": 100 }'
    expected=4950
    run sed -E -f sum-of-multiples.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'no factors means an empty sum' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "sum", "factors": [], "limit": 10000 }'
    expected=0
    run sed -E -f sum-of-multiples.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'the only multiple of 0 is 0' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "sum", "factors": [0], "limit": 1 }'
    expected=0
    run sed -E -f sum-of-multiples.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'the factor 0 does not affect the sum of multiples of other factors' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "sum", "factors": [3, 0], "limit": 4 }'
    expected=3
    run sed -E -f sum-of-multiples.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
