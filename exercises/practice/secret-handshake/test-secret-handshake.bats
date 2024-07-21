#!/usr/bin/env bats
load bats-extra

@test 'wink for 1' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=1
    expected='wink'
    run sed -E -f secret-handshake.sed <<< $input
    assert_success
    assert_output "$expected"
}

@test 'double blink for 10' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=2
    expected='double blink'
    run sed -E -f secret-handshake.sed <<< $input
    assert_success
    assert_output "$expected"
}

@test 'close your eyes for 100' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=4
    expected='close your eyes'
    run sed -E -f secret-handshake.sed <<< $input
    assert_success
    assert_output "$expected"
}

@test 'jump for 1000' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=8
    expected='jump'
    run sed -E -f secret-handshake.sed <<< $input
    assert_success
    assert_output "$expected"
}

@test 'combine two actions' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=3
    expected=$'wink\ndouble blink'
    run sed -E -f secret-handshake.sed <<< $input
    assert_success
    assert_output "$expected"
}

@test 'reverse two actions' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=19
    expected=$'double blink\nwink'
    run sed -E -f secret-handshake.sed <<< $input
    assert_success
    assert_output "$expected"
}

@test 'reversing one action gives the same action' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=24
    expected='jump'
    run sed -E -f secret-handshake.sed <<< $input
    assert_success
    assert_output "$expected"
}

@test 'reversing no actions still gives no actions' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=16
    expected=''
    run sed -E -f secret-handshake.sed <<< $input
    assert_success
    assert_output "$expected"
}

@test 'all possible actions' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=15
    expected="$(cat <<EOT
wink
double blink
close your eyes
jump
EOT
        )"
    run sed -E -f secret-handshake.sed <<< $input
    assert_success
    assert_output "$expected"
}

@test 'reverse all possible actions' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=31
    expected="$(cat <<EOT
jump
close your eyes
double blink
wink
EOT
        )"
    run sed -E -f secret-handshake.sed <<< $input
    assert_success
    assert_output "$expected"
}

@test 'do nothing for zero' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=0
    expected=''
    run sed -E -f secret-handshake.sed <<< $input
    assert_success
    assert_output "$expected"
}
