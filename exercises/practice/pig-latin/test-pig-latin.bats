#!/usr/bin/env bats
load bats-extra

## ay is added to words that start with vowels
@test 'word beginning with a' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='apple'
    expected='appleay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with e' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='ear'
    expected='earay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with i' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='igloo'
    expected='iglooay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with o' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='object'
    expected='objectay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with u' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='under'
    expected='underay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with a vowel and followed by a qu' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='equal'
    expected='equalay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

## first letter and ay are moved to the end of words that start with
## consonants
@test 'word beginning with p' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='pig'
    expected='igpay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with k' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='koala'
    expected='oalakay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with x' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='xenon'
    expected='enonxay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with q without a following u' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='qat'
    expected='atqay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

## some letter clusters are treated like a single consonant
@test 'word beginning with ch' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='chair'
    expected='airchay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with qu' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='queen'
    expected='eenquay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with qu and a preceding consonant' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='square'
    expected='aresquay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with th' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='therapy'
    expected='erapythay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with thr' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='thrush'
    expected='ushthray'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with sch' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='school'
    expected='oolschay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

## some letter clusters are treated like a single vowel
@test 'word beginning with yt' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='yttria'
    expected='yttriaay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'word beginning with xr' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='xray'
    expected='xrayay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

## position of y in a word determines if it is a consonant or a vowel
@test 'y is treated like a consonant at the beginning of a word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='yellow'
    expected='ellowyay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'y is treated like a vowel at the end of a consonant cluster' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='rhythm'
    expected='ythmrhay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'y as second letter in two letter word' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='my'
    expected='ymay'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

## phrases are translated
@test 'a whole phrase' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='quick fast run'
    expected='ickquay astfay unray'
    run sed -E -f pig-latin.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
