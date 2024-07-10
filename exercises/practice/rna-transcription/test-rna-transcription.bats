#!/usr/bin/env bats
load bats-extra

@test 'empty rna sequence' {
    run sed -E -f rna-transcription.sed <<< ''
    assert_success
    assert_output ''
}

@test 'transcribes cytosine to guanine' {
    run sed -E -f rna-transcription.sed <<< 'C'
    assert_success
    assert_output 'G'
}

@test 'transcribes guanine to cytosine' {
    run sed -E -f rna-transcription.sed <<< 'G'
    assert_success
    assert_output 'C'
}

@test 'transcribes adenine to uracil' {
    run sed -E -f rna-transcription.sed <<< 'A'
    assert_success
    assert_output 'U'
}

@test 'transcribes thymine to adenine' {
    run sed -E -f rna-transcription.sed <<< 'T'
    assert_success
    assert_output 'A'
}

@test 'it transcribes all nucleotides' {
    run sed -E -f rna-transcription.sed <<< 'ACGTGGTCTTAA'
    assert_success
    assert_output 'UGCACCAGAAUU'
}

@test 'it validates dna strands' {
    run sed -E -f rna-transcription.sed <<< 'XCGFGGTDTTAA'
    assert_failure
    assert_output 'INVALID DNA STRAND'
}
