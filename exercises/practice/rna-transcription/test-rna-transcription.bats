#!/usr/bin/env bats
load bats-extra

@test 'empty rna sequence' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f rna-transcription.sed <<< ''
    assert_success
    assert_output ''
}

@test 'transcribes cytosine to guanine' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f rna-transcription.sed <<< 'C'
    assert_success
    assert_output 'G'
}

@test 'transcribes guanine to cytosine' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f rna-transcription.sed <<< 'G'
    assert_success
    assert_output 'C'
}

@test 'transcribes adenine to uracil' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f rna-transcription.sed <<< 'A'
    assert_success
    assert_output 'U'
}

@test 'transcribes thymine to adenine' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f rna-transcription.sed <<< 'T'
    assert_success
    assert_output 'A'
}

@test 'it transcribes all nucleotides' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f rna-transcription.sed <<< 'ACGTGGTCTTAA'
    assert_success
    assert_output 'UGCACCAGAAUU'
}

@test 'it validates dna strands' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    run sed -E -f rna-transcription.sed <<< 'XCGFGGTDTTAA'
    assert_failure
    assert_output 'INVALID DNA STRAND'
}
