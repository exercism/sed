#!/usr/bin/env bats
load bats-extra

@test 'count one word' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='word'
    expected='"word": 1'
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'count one of each word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='one of each'
    expected="$(cat <<EOT
"one": 1
"of": 1
"each": 1
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'multiple occurrences of a word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='one fish two fish red fish blue fish'
    expected="$(cat <<EOT
"one": 1
"fish": 4
"two": 1
"red": 1
"blue": 1
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'handles cramped lists' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='one,two,three'
    expected="$(cat <<EOT
"one": 1
"two": 1
"three": 1
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'handles expanded lists' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$'one,\ntwo,\nthree'
    expected="$(cat <<EOT
"one": 1
"two": 1
"three": 1
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'ignore punctuation' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='car: carpet as java: javascript!!&@$%^&'
    expected="$(cat <<EOT
"car": 1
"carpet": 1
"as": 1
"java": 1
"javascript": 1
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'include numbers' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='testing, 1, 2 testing'
    expected="$(cat <<EOT
"testing": 2
"1": 1
"2": 1
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'normalize case' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='go Go GO Stop stop'
    expected="$(cat <<EOT
"go": 3
"stop": 2
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'with apostrophes #1' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="First: don't laugh. Then: don't cry."
    expected="$(cat <<EOT
"first": 1
"don't": 2
"laugh": 1
"then": 1
"cry": 1
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'with apostrophes #2' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="'First: don't laugh. Then: don't cry. You're getting it.'"
    expected="$(cat <<EOT
"first": 1
"don't": 2
"laugh": 1
"then": 1
"cry": 1
"you're": 1
"getting": 1
"it": 1
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'with quotations' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="Joe can't tell between 'large' and large."
    expected="$(cat <<EOT
"joe": 1
"can't": 1
"tell": 1
"between": 1
"large": 2
"and": 1
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'substrings from the beginning' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="Joe can't tell between app, apple and a."
    expected="$(cat <<EOT
"joe": 1
"can't": 1
"tell": 1
"between": 1
"app": 1
"apple": 1
"and": 1
"a": 1
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'multiple spaces not detected as a word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=' multiple   whitespaces'
    expected="$(cat <<EOT
"multiple": 1
"whitespaces": 1
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'alternating word separators not detected as a word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
,
,one,
 ,two
 'three'
EOT
        )"
    expected="$(cat <<EOT
"one": 1
"two": 1
"three": 1
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'quotation for word with apostrophe' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="can, can't, 'can't'"
    expected="$(cat <<EOT
"can": 1
"can't": 2
EOT
        )"
    run sed -E -f word-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
