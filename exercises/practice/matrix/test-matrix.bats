#!/usr/bin/env bats
load bats-extra

@test 'extract row from one number matrix' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    property='row'
    index=1
    matrix='1'
    input="$(cat <<EOT
$property:$index
$matrix
EOT
        )"
    expected='1'
    run sed -E -f matrix.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can extract row' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    property='row'
    index=2
    matrix=$'1 2\n3 4'
    input="$(cat <<EOT
$property:$index
$matrix
EOT
        )"
    expected='3 4'
    run sed -E -f matrix.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'extract row where numbers have different widths' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    property='row'
    index=2
    matrix=$'1 2\n10 20'
    input="$(cat <<EOT
$property:$index
$matrix
EOT
        )"
    expected='10 20'
    run sed -E -f matrix.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can extract row from non-square matrix with no corresponding column' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    property='row'
    index=4
    matrix=$'1 2 3\n4 5 6\n7 8 9\n8 7 6'
    input="$(cat <<EOT
$property:$index
$matrix
EOT
        )"
    expected='8 7 6'
    run sed -E -f matrix.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'extract column from one number matrix' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    property='column'
    index=1
    matrix='1'
    input="$(cat <<EOT
$property:$index
$matrix
EOT
        )"
    expected='1'
    run sed -E -f matrix.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can extract column' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    property='column'
    index=3
    matrix=$'1 2 3\n4 5 6\n7 8 9'
    input="$(cat <<EOT
$property:$index
$matrix
EOT
        )"
    expected=$'3\n6\n9'
    run sed -E -f matrix.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can extract column from non-square matrix with no corresponding row' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    property='column'
    index=4
    matrix=$'1 2 3 4\n5 6 7 8\n9 8 7 6'
    input="$(cat <<EOT
$property:$index
$matrix
EOT
        )"
    expected=$'4\n8\n6'
    run sed -E -f matrix.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'extract column where numbers have different widths' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    property='column'
    index=2
    matrix=$'89 1903 3\n18 3 1\n9 4 800'
    input="$(cat <<EOT
$property:$index
$matrix
EOT
        )"
    expected=$'1903\n3\n4'
    run sed -E -f matrix.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
