#!/usr/bin/env bats
load bats-extra

@test 'paired square brackets' {
    run sed -E -f matching-brackets.sed <<< '[]'
    assert_success
    assert_output 'true'
}

@test 'empty string' {
    run sed -E -f matching-brackets.sed <<< ''
    assert_success
    assert_output 'true'
}

@test 'unpaired brackets' {
    run sed -E -f matching-brackets.sed <<< '[['
    assert_success
    assert_output 'false'
}

@test 'wrong ordered brackets' {
    run sed -E -f matching-brackets.sed <<< '}{'
    assert_success
    assert_output 'false'
}

@test 'wrong closing bracket' {
    run sed -E -f matching-brackets.sed <<< '{]'
    assert_success
    assert_output 'false'
}

@test 'paired with whitespace' {
    run sed -E -f matching-brackets.sed <<< '{ }'
    assert_success
    assert_output 'true'
}

@test 'partially paired brackets' {
    run sed -E -f matching-brackets.sed <<< '{[])'
    assert_success
    assert_output 'false'
}

@test 'simple nested brackets' {
    run sed -E -f matching-brackets.sed <<< '{[]}'
    assert_success
    assert_output 'true'
}

@test 'several paired brackets' {
    run sed -E -f matching-brackets.sed <<< '{}[]'
    assert_success
    assert_output 'true'
}

@test 'paired and nested brackets' {
    run sed -E -f matching-brackets.sed <<< '([{}({}[])])'
    assert_success
    assert_output 'true'
}

@test 'unopened closing brackets' {
    run sed -E -f matching-brackets.sed <<< '{[)][]}'
    assert_success
    assert_output 'false'
}

@test 'unpaired and nested brackets' {
    run sed -E -f matching-brackets.sed <<< '([{])'
    assert_success
    assert_output 'false'
}

@test 'paired and wrong nested brackets' {
    run sed -E -f matching-brackets.sed <<< '[({]})'
    assert_success
    assert_output 'false'
}

@test 'paired and wrong nested brackets but innermost are correct' {
    run sed -E -f matching-brackets.sed <<< '[({}])'
    assert_success
    assert_output 'false'
}

@test 'paired and incomplete brackets' {
    run sed -E -f matching-brackets.sed <<< '{}['
    assert_success
    assert_output 'false'
}

@test 'too many closing brackets' {
    run sed -E -f matching-brackets.sed <<< '[]]'
    assert_success
    assert_output 'false'
}

@test 'early unexpected brackets' {
    run sed -E -f matching-brackets.sed <<< ')()'
    assert_success
    assert_output 'false'
}

@test 'early mismatched brackets' {
    run sed -E -f matching-brackets.sed <<< '{)()'
    assert_success
    assert_output 'false'
}

@test 'math expression' {
    run sed -E -f matching-brackets.sed <<< '(((185 + 223.85) * 15) - 543)/2'
    assert_success
    assert_output 'true'
}

@test 'complex latex expression' {
    run sed -E -f matching-brackets.sed <<< '\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)'
    assert_success
    assert_output 'true'
}
