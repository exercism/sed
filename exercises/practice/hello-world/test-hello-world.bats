#!/usr/bin/env bats
load bats-extra

@test 'Say Hi!' {
    run sed -E -f hello-world.sed <<< ''
    assert_success
    expected='Hello, World!'
    assert_equal "$output" "$expected"
}
