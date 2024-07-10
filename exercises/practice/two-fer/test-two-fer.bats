#!/usr/bin/env bats
load bats-extra

@test 'no name given' {
  run sed -E -f two-fer.sed <<< ''
  assert_success
  assert_output 'One for you, one for me.'
}

@test 'a name given' {
  run sed -E -f two-fer.sed <<< 'Alice'
  assert_success
  assert_output 'One for Alice, one for me.'
}

@test 'another name given' {
  run sed -E -f two-fer.sed <<< 'Bob'
  assert_success
  assert_output 'One for Bob, one for me.'
}
