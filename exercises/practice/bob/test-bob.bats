#!/usr/bin/env bats
load bats-extra

@test "stating something" {
  run sed -E -f bob.sed <<< 'Tom-ay-to, tom-aaaah-to.'
  assert_success
  assert_output "Whatever."
}

@test "shouting" {
  run sed -E -f bob.sed <<< 'WATCH OUT!'
  assert_success
  assert_output "Whoa, chill out!"
}

@test "shouting gibberish" {
  run sed -E -f bob.sed <<< 'FCECDFCAAB'
  assert_success
  assert_output "Whoa, chill out!"
}

@test "asking a question" {
  run sed -E -f bob.sed <<< 'Does this cryogenic chamber make me look fat?'
  assert_success
  assert_output "Sure."
}

@test "asking a numeric question" {
  run sed -E -f bob.sed <<< 'You are, what, like 15?'
  assert_success
  assert_output "Sure."
}

@test "asking gibberish" {
  run sed -E -f bob.sed <<< 'fffbbcbeab?'
  assert_success
  assert_output "Sure."
}

@test "talking forcefully" {
  run sed -E -f bob.sed <<< "Hi there!"
  assert_success
  assert_output "Whatever."
}

@test "using acronyms in regular speech" {
  run sed -E -f bob.sed <<< "It's OK if you don't want to go work for NASA."
  assert_success
  assert_output "Whatever."
}

@test "forceful question" {
  run sed -E -f bob.sed <<< "WHAT'S GOING ON?"
  assert_success
  assert_output "Calm down, I know what I'm doing!"
}

@test "shouting numbers" {
  run sed -E -f bob.sed <<< '1, 2, 3 GO!'
  assert_success
  assert_output "Whoa, chill out!"
}

@test "no letters" {
  run sed -E -f bob.sed <<< '1, 2, 3'
  assert_success
  assert_output "Whatever."
}

@test "question with no letters" {
  run sed -E -f bob.sed <<< '4?'
  assert_success
  assert_output "Sure."
}

@test "shouting with special characters" {
  run sed -E -f bob.sed <<< 'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'
  assert_success
  assert_output "Whoa, chill out!"
}

@test "shouting with no exclamation mark" {
  run sed -E -f bob.sed <<< 'I HATE THE DENTIST'
  assert_success
  assert_output "Whoa, chill out!"
}

@test "statement containing question mark" {
  run sed -E -f bob.sed <<< 'Ending with ? means a question.'
  assert_success
  assert_output "Whatever."
}

@test "non-letters with question" {
  run sed -E -f bob.sed <<< ':) ?'
  assert_success
  assert_output "Sure."
}

@test "prattling on" {
  run sed -E -f bob.sed <<< 'Wait! Hang on. Are you going to be OK?'
  assert_success
  assert_output "Sure."
}

@test "silence" {
  run sed -E -f bob.sed <<< ''
  assert_success
  assert_output "Fine. Be that way!"
}

@test "prolonged silence" {
  run sed -E -f bob.sed <<< '          '
  assert_success
  assert_output "Fine. Be that way!"
}

@test "alternate silence" {
  run sed -E -f bob.sed <<< $'\t\t\t\t\t\t\t\t\t\t'
  assert_success
  assert_output "Fine. Be that way!"
}

@test "multiple line question" {
  run sed -E -f bob.sed <<< $'\nDoes this cryogenic chamber make me look fat?\nNo'
  assert_success
  assert_output "Whatever."
}

@test "starting with whitespace" {
  run sed -E -f bob.sed <<< '         hmmmmmmm...'
  assert_success
  assert_output "Whatever."
}

@test "ending with whitespace" {
  run sed -E -f bob.sed <<< 'Okay if like my  spacebar  quite a bit?   '
  assert_success
  assert_output "Sure."
}

@test "other whitespace" {
  run sed -E -f bob.sed <<< $'\n\r \t'
  assert_success
  assert_output "Fine. Be that way!"
}

@test "non-question ending with whitespace" {
  run sed -E -f bob.sed <<< 'This is a statement ending with whitespace      '
  assert_success
  assert_output "Whatever."
}

@test "no input is silence" {
  run sed -E -f bob.sed <<< ''
  assert_success
  assert_output "Fine. Be that way!"
}

@test "yelling a filename expansion" {
  run sed -E -f bob.sed <<< '*READ* !'
  assert_success
  assert_output "Whoa, chill out!"
}

@test "asking a filename expansion" {
  run sed -E -f bob.sed <<< 'bob???'
  assert_success
  assert_output "Sure."
}
