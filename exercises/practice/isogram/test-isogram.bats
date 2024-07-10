#!/usr/bin/env bats
load bats-extra

# Check if the given string is an isogram

@test 'empty string' {
  run sed -E -f isogram.sed <<< ''
  assert_success
  assert_output "true"
}

@test 'isogram with only lower case characters' {
  run sed -E -f isogram.sed <<< 'isogram'
  assert_success
  assert_output "true"
}

@test 'word with one duplicated character' {
  run sed -E -f isogram.sed <<< 'eleven'
  assert_success
  assert_output "false"
}

@test 'word with one duplicated character from the end of the alphabet' {
  run sed -E -f isogram.sed <<< 'zzyzx'
  assert_success
  assert_output "false"
}

@test 'longest reported english isogram' {
  run sed -E -f isogram.sed <<< 'subdermatoglyphic'
  assert_success
  assert_output "true"
}

@test 'word with duplicated character in mixed case' {
  run sed -E -f isogram.sed <<< 'Alphabet'
  assert_success
  assert_output "false"
}

@test 'hypothetical isogrammic word with hyphen' {
  run sed -E -f isogram.sed <<< 'thumbscrew-japingly'
  assert_success
  assert_output "true"
}

@test 'isogram with duplicated hyphen' {
  run sed -E -f isogram.sed <<< 'six-year-old'
  assert_success
  assert_output "true"
}

@test 'hypothetical word with duplicated character following hyphen' {
  run sed -E -f isogram.sed <<< 'thumbscrew-jappingly'
  assert_success
  assert_output "false"
}

@test 'made-up name that is an isogram' {
  run sed -E -f isogram.sed <<< 'Emily Jung Schwartzkopf'
  assert_success
  assert_output "true"
}

@test 'duplicated character in the middle' {
  run sed -E -f isogram.sed <<< 'accentor'
  assert_success
  assert_output "false"
}

@test 'word with duplicated character in mixed case, lowercase first' {
  run sed -E -f isogram.sed <<< 'alphAbet'
  assert_success
  assert_output "false"
}

@test 'same first and last characters' {
  run sed -E -f isogram.sed <<< 'angola'
  assert_success
  assert_output "false"
}

@test 'word with duplicated character and with two hyphens' {
  run sed -E -f isogram.sed <<< 'up-to-date'
  assert_success
  assert_output "false"
}
