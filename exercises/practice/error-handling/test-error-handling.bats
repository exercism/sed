#!/usr/bin/env bats
load bats-extra

@test "correct arguments" {
  run sed -E -f error-handling.sed <<< Alice
  assert_success
  assert_output "Hello, Alice"
}

@test "one long argument" {
  run sed -E -f error-handling.sed <<< 'Alice and Bob'
  assert_success
  assert_output "Hello, Alice and Bob"
}

@test "incorrect arguments" {
  run sed -E -f error-handling.sed <<< 'Alice Bob'
  assert_failure
  assert_output "Usage: error-handling.sh <person>"
}

@test "print usage banner with no value given" {
  run sed -E -f error-handling.sed  <<< ''
  assert_failure
  assert_output "Usage: error-handling.sh <person>"
}
