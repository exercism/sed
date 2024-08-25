#!/usr/bin/env bats
load bats-extra

@test 'finds the largest product if span equals length' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "largestProduct", "digits": "29", "span": 2 }'
    expected=18
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can find the largest product of 2 with numbers in order' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "largestProduct", "digits": "0123456789", "span": 2 }'
    expected=72
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can find the largest product of 2' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "largestProduct", "digits": "576802143", "span": 2 }'
    expected=48
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can find the largest product of 3 with numbers in order' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "largestProduct", "digits": "0123456789", "span": 3 }'
    expected=504
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can find the largest product of 3' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "largestProduct", "digits": "1027839564", "span": 3 }'
    expected=270
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can find the largest product of 5 with numbers in order' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "largestProduct", "digits": "0123456789", "span": 5 }'
    expected=15120
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'reports zero if the only digits are zero' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "largestProduct", "digits": "0000", "span": 2 }'
    expected=0
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'reports zero if all spans include zero' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "largestProduct", "digits": "99099", "span": 3 }'
    expected=0
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'rejects span longer than string length' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "largestProduct", "digits": "123", "span": 4 }'
    expected='{"error":"span must be smaller than string length"}'
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'reports 1 for empty string and empty product (0 span)' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    ## There may be some confusion about whether this should be 1 or error.
    ## The reasoning for it being 1 is this:
    ## There is one 0-character string contained in the empty string.
    ## That's the empty string itself.
    ## The empty product is 1 (the identity for multiplication).
    ## Therefore LSP('', 0) is 1.
    ## It's NOT the case that LSP('', 0) takes max of an empty list.
    ## So there is no error.
    ## Compare against LSP('123', 4):
    ## There are zero 4-character strings in '123'.
    ## So LSP('123', 4) really DOES take the max of an empty list.
    ## So LSP('123', 4) errors and LSP('', 0) does NOT.
    input='{ "property": "largestProduct", "digits": "", "span": 0 }'
    expected=1
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'reports 1 for nonempty string and empty product (0 span)' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    ## As above, there is one 0-character string in '123'.
    ## So again no error. It's the empty product, 1.
    input='{ "property": "largestProduct", "digits": "123", "span": 0 }'
    expected=1
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'rejects empty string and nonzero span' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "largestProduct", "digits": "", "span": 1 }'
    expected='{"error":"span must be smaller than string length"}'
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'rejects invalid character in digits' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "largestProduct", "digits": "1234a5", "span": 2 }'
    expected='{"error":"digits input must only contain digits"}'
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'rejects negative span' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "largestProduct", "digits": "12345", "span": -1 }'
    expected='{"error":"span must not be negative"}'
    run sed -E -f largest-series-product.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}
