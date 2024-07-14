#!/usr/bin/env bats
load bats-extra

@test 'English language short' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='Hi'
    expected='Hi'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'English language long' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='Hello there'
    expected='Hello'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'German language short (broth)' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='brühe'
    expected='brühe'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'German language long (bear carpet → beards)' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='Bärteppich'
    expected='Bärte'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Bulgarian language short (good)' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='Добър'
    expected='Добър'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Greek language short (health)' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='υγειά'
    expected='υγειά'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Maths short' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='a=πr²'
    expected='a=πr²'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Maths long' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='∅⊊ℕ⊊ℤ⊊ℚ⊊ℝ⊊ℂ'
    expected='∅⊊ℕ⊊ℤ'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'English and emoji short' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='Fly 🛫'
    expected='Fly 🛫'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Emoji short' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='💇'
    expected='💇'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Emoji long' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='❄🌡🤧🤒🏥🕰😀'
    expected='❄🌡🤧🤒🏥'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Royal Flush?' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='🃎🂸🃅🃋🃍🃁🃊'
    expected='🃎🂸🃅🃋🃍'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Multiline message' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
Good!
Multiline
messages are
easy
too!
Yeah!
EOT
)"

    expected='Good!'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
