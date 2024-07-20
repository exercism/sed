#!/usr/bin/env bats
load bats-extra

@test ' 0 eggs' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=0
    expected=0
    run sed -E -f eliuds-eggs.sed <<< $input
    assert_success
    assert_output $expected
}

@test ' 1 eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=16
    expected=1
    run sed -E -f eliuds-eggs.sed <<< $input
    assert_success
    assert_output $expected
}

@test ' 2 eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=36
    expected=2
    run sed -E -f eliuds-eggs.sed <<< $input
    assert_success
    assert_output $expected
}

@test ' 3 eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=2082
    expected=3
    run sed -E -f eliuds-eggs.sed <<< $input
    assert_success
    assert_output $expected
}

@test ' 4 eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=89
    expected=4
    run sed -E -f eliuds-eggs.sed <<< $input
    assert_success
    assert_output $expected
}

@test ' 5 eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=3148
    expected=5
    run sed -E -f eliuds-eggs.sed <<< $input
    assert_success
    assert_output $expected
}

@test ' 6 eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=3480
    expected=6
    run sed -E -f eliuds-eggs.sed <<< $input
    assert_success
    assert_output $expected
}

@test ' 7 eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=2298
    expected=7
    run sed -E -f eliuds-eggs.sed <<< $input
    assert_success
    assert_output $expected
}

@test ' 8 eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=3855
    expected=8
    run sed -E -f eliuds-eggs.sed <<< $input
    assert_success
    assert_output $expected
}

@test ' 9 eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=1407
    expected=9
    run sed -E -f eliuds-eggs.sed <<< $input
    assert_success
    assert_output $expected
}

@test '10 eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=3519
    expected=10
    run sed -E -f eliuds-eggs.sed <<< $input
    assert_success
    assert_output $expected
}

@test '11 eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=3583
    expected=11
    run sed -E -f eliuds-eggs.sed <<< $input
    assert_success
    assert_output $expected
}

@test '13 eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=8191
    expected=13
    run sed -E -f eliuds-eggs.sed <<< $input
    assert_success
    assert_output $expected
}
