#!/usr/bin/env bats
load bats-extra

@test 'empty strand' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "nucleotideCounts", "strand": ""'
    expected="$(cat <<EOT
"A": 0
"C": 0
"G": 0
"T": 0
EOT
    )"
    run sed -E -f nucleotide-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can count one nucleotide in single-character input' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "nucleotideCounts", "strand": "G"'
    expected="$(cat <<EOT
"A": 0
"C": 0
"G": 1
"T": 0
EOT
    )"
    run sed -E -f nucleotide-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'strand with repeated nucleotide' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "nucleotideCounts", "strand": "GGGGGGG"'
    expected="$(cat <<EOT
"A": 0
"C": 0
"G": 7
"T": 0
EOT
    )"
    run sed -E -f nucleotide-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'strand with multiple nucleotides' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "nucleotideCounts", "strand": "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"'
    expected="$(cat <<EOT
"A": 20
"C": 12
"G": 17
"T": 21
EOT
    )"
    run sed -E -f nucleotide-count.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'strand with invalid nucleotides' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='"property": "nucleotideCounts", "strand": "AGXXACT"'
    expected='Invalid nucleotide in strand'
    run sed -E -f nucleotide-count.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}
