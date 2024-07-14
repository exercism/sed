#!/usr/bin/env bats
load bats-extra

@test "correct arguments" {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f error-handling.sed <<< Alice
    assert_success
    assert_output "Hello, Alice"
}

@test "one long argument" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f error-handling.sed <<< 'Alice and Bob'
    assert_success
    assert_output "Hello, Alice and Bob"
}

@test "incorrect arguments" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f error-handling.sed <<< 'Alice Bob'
    assert_failure
    assert_output "Usage: error-handling.sh <person>"
}

@test "print usage banner with no value given" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f error-handling.sed  <<< ''
    assert_failure
    assert_output "Usage: error-handling.sh <person>"
}
