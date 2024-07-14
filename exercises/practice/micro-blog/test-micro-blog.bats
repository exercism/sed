#!/usr/bin/env bats
load bats-extra

@test 'English language short' {
    input='Hi'
    expected='Hi'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'English language long' {
    input='Hello there'
    expected='Hello'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'German language short (broth)' {
    input='brühe'
    expected='brühe'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'German language long (bear carpet → beards)' {
    input='Bärteppich'
    expected='Bärte'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Bulgarian language short (good)' {
    input='Добър'
    expected='Добър'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Greek language short (health)' {
    input='υγειά'
    expected='υγειά'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Maths short' {
    input='a=πr²'
    expected='a=πr²'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Maths long' {
    input='∅⊊ℕ⊊ℤ⊊ℚ⊊ℝ⊊ℂ'
    expected='∅⊊ℕ⊊ℤ'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'English and emoji short' {
    input='Fly 🛫'
    expected='Fly 🛫'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Emoji short' {
    input='💇'
    expected='💇'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Emoji long' {
    input='❄🌡🤧🤒🏥🕰😀'
    expected='❄🌡🤧🤒🏥'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Royal Flush?' {
    input='🃎🂸🃅🃋🃍🃁🃊'
    expected='🃎🂸🃅🃋🃍'
    run sed -E -f micro-blog.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Multiline message' {
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
