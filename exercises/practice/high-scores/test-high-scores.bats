#!/usr/bin/env bats
load bats-extra

@test 'List of scores' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
"scores": [30, 50, 20, 70]
"property": "scores"
EOT
        )"
    expected='"scores": [30, 50, 20, 70]'
    run sed -E -f high-scores.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Latest score' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
"scores": [100, 0, 90, 30]
"property": "latest"
EOT
    )"
    expected='"latest": 30'
    run sed -E -f high-scores.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Personal best' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
"scores": [40, 100, 70]
"property": "personalBest"
EOT
    )"
    expected='"personalBest": 100'
    run sed -E -f high-scores.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Personal top three from a list of scores' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
"scores": [10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70]
"property": "personalTopThree"
EOT
    )"
    expected='"personalTopThree": [100, 90, 70]'
    run sed -E -f high-scores.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Personal top highest to lowest' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
"scores": [20, 10, 30]
"property": "personalTopThree"
EOT
    )"
    expected='"personalTopThree": [30, 20, 10]'
    run sed -E -f high-scores.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Personal top when there is a tie' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
"scores": [40, 20, 40, 30]
"property": "personalTopThree"
EOT
    )"
    expected='"personalTopThree": [40, 40, 30]'
    run sed -E -f high-scores.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Personal top when there are less than 3' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
"scores": [30, 70]
"property": "personalTopThree"
EOT
    )"
    expected='"personalTopThree": [70, 30]'
    run sed -E -f high-scores.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Personal top when there is only one' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
"scores": [40]
"property": "personalTopThree"
EOT
    )"
    expected='"personalTopThree": [40]'
    run sed -E -f high-scores.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Latest score after personal top scores' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
"scores": [70, 50, 20, 30]
"property": "personalTopThree"
"property": "latest"
EOT
    )"
    expected="$(cat <<EOT
"personalTopThree": [70, 50, 30]
"latest": 30
EOT
        )"
    run sed -E -f high-scores.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Scores after personal top scores' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
"scores": [30, 50, 20, 70]
"property": "personalTopThree"
"property": "scores"
EOT
        )"
    expected="$(cat <<EOT
"personalTopThree": [70, 50, 30]
"scores": [30, 50, 20, 70]
EOT
        )"
    run sed -E -f high-scores.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Latest score after personal best' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
"scores": [20, 70, 15, 25, 30]
"property": "personalBest"
"property": "latest"
EOT
        )"
    expected='30'
    expected="$(cat <<EOT
"personalBest": 70
"latest": 30
EOT
        )"
    run sed -E -f high-scores.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Scores after personal best' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
"scores": [20, 70, 15, 25, 30]
"property": "personalBest"
"property": "scores"
EOT
        )"
    expected="$(cat <<EOT
"personalBest": 70
"scores": [20, 70, 15, 25, 30]
EOT
        )"
    run sed -E -f high-scores.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
