#!/usr/bin/env bats
load bats-extra

@test 'an empty string' {
  run sed -E -f reverse-string.sed <<< ''
  assert_success
  assert_output ''
}

@test 'a word' {
  run sed -E -f reverse-string.sed <<< 'robot'
  assert_success
  assert_output 'tobor'
}

@test 'a capitalised word' {
  run sed -E -f reverse-string.sed <<< 'Ramen'
  assert_success
  assert_output 'nemaR'
}

@test 'a sentence with punctuation' {
  run sed -E -f reverse-string.sed <<< "I'm hungry!"
  assert_success
  assert_output "!yrgnuh m'I"
}

@test 'a palindrome' {
  run sed -E -f reverse-string.sed <<< 'racecar'
  assert_success
  assert_output 'racecar'
}

@test 'an even-sized word' {
  run sed -E -f reverse-string.sed <<< 'drawer'
  assert_success
  assert_output 'reward'
}
