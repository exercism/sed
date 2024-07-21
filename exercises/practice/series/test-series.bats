#!/usr/bin/env bats
load bats-extra

@test 'slices of one from one' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    series=1
    slice_length=1
    input="$series $slice_length"
    expected=1
    run sed -E -f series.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'slices of one from two' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    series=12
    slice_length=1
    input="$series $slice_length"
    expected=$'1\n2'
    run sed -E -f series.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'slices of two' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    series=35
    slice_length=2
    input="$series $slice_length"
    expected=35
    run sed -E -f series.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'slices of two overlap' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    series=9142
    slice_length=2
    input="$series $slice_length"
    expected=$'91\n14\n42'
    run sed -E -f series.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'slices can include duplicates' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    series=777777
    slice_length=3
    input="$series $slice_length"
    expected=$'777\n777\n777\n777'
    run sed -E -f series.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'slices of a long series' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    series=918493904243
    slice_length=5
    input="$series $slice_length"
    expected="$(cat <<EOT
91849
18493
84939
49390
93904
39042
90424
04243
EOT
        )"
    run sed -E -f series.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'slice length is too large' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    series=12345
    slice_length=6
    input="$series $slice_length"
    expected='slice length cannot be greater than series length'
    run sed -E -f series.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'slice length is way too large' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    series=12345
    slice_length=42
    input="$series $slice_length"
    expected='slice length cannot be greater than series length'
    run sed -E -f series.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'slice length cannot be zero' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    series=12345
    slice_length=0
    input="$series $slice_length"
    expected='slice length cannot be zero'
    run sed -E -f series.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'slice length cannot be negative' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    series=123
    slice_length=-1
    input="$series $slice_length"
    expected='slice length cannot be negative'
    run sed -E -f series.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'empty series is invalid' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    series=''
    slice_length=1
    input="$series $slice_length"
    expected='series cannot be empty'
    run sed -E -f series.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

