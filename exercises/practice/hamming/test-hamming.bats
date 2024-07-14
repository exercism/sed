#!/usr/bin/env bats
load bats-extra

@test 'empty strands' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    strand1=''
    strand2=''
    expected=0
    run sed -E -f hamming.sed << END_INPUT
$strand1
$strand2
END_INPUT
    assert_success
    assert_output "$expected"
}

@test 'single letter identical strands' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    strand1='A'
    strand2='A'
    expected=0
    run sed -E -f hamming.sed << END_INPUT
$strand1
$strand2
END_INPUT
    assert_success
    assert_output "$expected"
}

@test 'single letter different strands' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    strand1='G'
    strand2='T'
    expected=1
    run sed -E -f hamming.sed << END_INPUT
$strand1
$strand2
END_INPUT
    assert_success
    assert_output "$expected"
}

@test 'long identical strands' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    strand1='GGACTGAAATCTG'
    strand2='GGACTGAAATCTG'
    expected=0
    run sed -E -f hamming.sed << END_INPUT
$strand1
$strand2
END_INPUT
    assert_success
    assert_output "$expected"
}

@test 'long different strands' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    strand1='GGACGGATTCTG'
    strand2='AGGACGGATTCT'
    expected=9
    run sed -E -f hamming.sed << END_INPUT
$strand1
$strand2
END_INPUT
    assert_success
    assert_output "$expected"
}

@test 'disallow first strand longer' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    strand1='AATG'
    strand2='AAA'
    expected='strands must be of equal length'
    run sed -E -f hamming.sed << END_INPUT
$strand1
$strand2
END_INPUT
    assert_failure
    assert_output "$expected"
}

@test 'disallow second strand longer' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    strand1='ATA'
    strand2='AGTG'
    expected='strands must be of equal length'
    run sed -E -f hamming.sed << END_INPUT
$strand1
$strand2
END_INPUT
    assert_failure
    assert_output "$expected"
}

@test 'disallow first empty strand' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    strand1=''
    strand2='G'
    expected='first strand must not be empty'
    run sed -E -f hamming.sed << END_INPUT
$strand1
$strand2
END_INPUT
    assert_failure
    assert_output "$expected"
}

@test 'disallow second empty strand' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    strand1='G'
    strand2=''
    expected='second strand must not be empty'
    run sed -E -f hamming.sed << END_INPUT
$strand1
$strand2
END_INPUT
    assert_failure
    assert_output "$expected"
}
