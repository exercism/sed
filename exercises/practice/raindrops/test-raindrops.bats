#!/usr/bin/env bats
load bats-extra

@test 'the sound for 1 is 1' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=1
    expected=1
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 3 is Pling' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=3
    expected='Pling'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 5 is Plang' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=5
    expected='Plang'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 7 is Plong' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=7
    expected='Plong'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 6 is Pling as it has a factor 3' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=6
    expected='Pling'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test '2 to the power 3 does not make a raindrop sound as 3 is the exponent not the base' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=8
    expected=8
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 9 is Pling as it has a factor 3' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=9
    expected='Pling'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 10 is Plang as it has a factor 5' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=10
    expected='Plang'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 14 is Plong as it has a factor of 7' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=14
    expected='Plong'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 15 is PlingPlang as it has factors 3 and 5' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=15
    expected='PlingPlang'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 21 is PlingPlong as it has factors 3 and 7' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=21
    expected='PlingPlong'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 25 is Plang as it has a factor 5' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=25
    expected='Plang'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 27 is Pling as it has a factor 3' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=27
    expected='Pling'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 35 is PlangPlong as it has factors 5 and 7' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=35
    expected='PlangPlong'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 49 is Plong as it has a factor 7' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=49
    expected='Plong'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 52 is 52' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=52
    expected=52
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 105 is PlingPlangPlong as it has factors 3, 5 and 7' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=105
    expected='PlingPlangPlong'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}

@test 'the sound for 3125 is Plang as it has a factor 5' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=3125
    expected='Plang'
    run sed -E -f raindrops.sed <<< $input
    assert_success
    assert_output $expected
}
