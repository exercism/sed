#!/usr/bin/env bats
load bats-extra

@test 'zero rows' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='count: 0'
    expected=''
    run sed -E -f pascals-triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'single row' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='count: 1'
    expected='1'
    run sed -E -f pascals-triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'two rows' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='count: 2'
    expected="$(cat <<EOT
1
1 1
EOT
        )"
    run sed -E -f pascals-triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'three rows' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='count: 3'
    expected="$(cat <<EOT
1
1 1
1 2 1
EOT
        )"
    run sed -E -f pascals-triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'four rows' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='count: 4'
    expected="$(cat <<EOT
1
1 1
1 2 1
1 3 3 1
EOT
        )"
    run sed -E -f pascals-triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'five rows' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='count: 5'
    expected="$(cat <<EOT
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
EOT
        )"
    run sed -E -f pascals-triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'six rows' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='count: 6'
    expected="$(cat <<EOT
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
1 5 10 10 5 1
EOT
        )"
    run sed -E -f pascals-triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'ten rows' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='count: 10'
    expected="$(cat <<EOT
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
1 5 10 10 5 1
1 6 15 20 15 6 1
1 7 21 35 35 21 7 1
1 8 28 56 70 56 28 8 1
1 9 36 84 126 126 84 36 9 1
EOT
        )"
    run sed -E -f pascals-triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
