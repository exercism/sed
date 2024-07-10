#!/usr/bin/env bats
load bats-extra

@test 'Empty RNA sequence results in no proteins' {
    run sed -E -f protein-translation.sed <<< ''
    assert_success
    assert_output ''
}

@test 'Methionine RNA sequence' {       
    run sed -E -f protein-translation.sed <<< 'AUG'
    assert_success
    assert_output 'Methionine'
}

@test 'Phenylalanine RNA sequence 1' {  
    run sed -E -f protein-translation.sed <<< 'UUU'
    assert_success
    assert_output 'Phenylalanine'
}

@test 'Phenylalanine RNA sequence 2' {  
    run sed -E -f protein-translation.sed <<< 'UUC'
    assert_success
    assert_output 'Phenylalanine'
}

@test 'Leucine RNA sequence 1' {        
    run sed -E -f protein-translation.sed <<< 'UUA'
    assert_success
    assert_output 'Leucine'
}

@test 'Leucine RNA sequence 2' {        
    run sed -E -f protein-translation.sed <<< 'UUG'
    assert_success
    assert_output 'Leucine'
}

@test 'Serine RNA sequence 1' { 
    run sed -E -f protein-translation.sed <<< 'UCU'
    assert_success
    assert_output 'Serine'
}

@test 'Serine RNA sequence 2' { 
    run sed -E -f protein-translation.sed <<< 'UCC'
    assert_success
    assert_output 'Serine'
}

@test 'Serine RNA sequence 3' { 
    run sed -E -f protein-translation.sed <<< 'UCA'
    assert_success
    assert_output 'Serine'
}

@test 'Serine RNA sequence 4' { 
    run sed -E -f protein-translation.sed <<< 'UCG'
    assert_success
    assert_output 'Serine'
}

@test 'Tyrosine RNA sequence 1' {       
    run sed -E -f protein-translation.sed <<< 'UAU'
    assert_success
    assert_output 'Tyrosine'
}

@test 'Tyrosine RNA sequence 2' {       
    run sed -E -f protein-translation.sed <<< 'UAC'
    assert_success
    assert_output 'Tyrosine'
}

@test 'Cysteine RNA sequence 1' {       
    run sed -E -f protein-translation.sed <<< 'UGU'
    assert_success
    assert_output 'Cysteine'
}

@test 'Cysteine RNA sequence 2' {       
    run sed -E -f protein-translation.sed <<< 'UGC'
    assert_success
    assert_output 'Cysteine'
}

@test 'Tryptophan RNA sequence' {       
    run sed -E -f protein-translation.sed <<< 'UGG'
    assert_success
    assert_output 'Tryptophan'
}

@test 'STOP codon RNA sequence 1' {     
    run sed -E -f protein-translation.sed <<< 'UAA'
    assert_success
    assert_output ''
}

@test 'STOP codon RNA sequence 2' {     
    run sed -E -f protein-translation.sed <<< 'UAG'
    assert_success
    assert_output ''
}

@test 'STOP codon RNA sequence 3' {     
    run sed -E -f protein-translation.sed <<< 'UGA'
    assert_success
    assert_output ''
}

@test 'Sequence of two protein codons translates into proteins' {
    run sed -E -f protein-translation.sed <<< 'UUUUUU'
    assert_success
    assert_output 'Phenylalanine Phenylalanine'
}

@test 'Sequence of two different protein codons translates into proteins' {
    run sed -E -f protein-translation.sed <<< 'UUAUUG'
    assert_success
    assert_output 'Leucine Leucine'
}

@test 'Translate RNA strand into correct protein list' {        
    run sed -E -f protein-translation.sed <<< 'AUGUUUUGG'
    assert_success
    assert_output 'Methionine Phenylalanine Tryptophan'
}

@test 'Translation stops if STOP codon at beginning of sequence' {      
    run sed -E -f protein-translation.sed <<< 'UAGUGG'
    assert_success
    assert_output ''
}

@test 'Translation stops if STOP codon at end of two-codon sequence' {  
    run sed -E -f protein-translation.sed <<< 'UGGUAG'
    assert_success
    assert_output 'Tryptophan'
}

@test 'Translation stops if STOP codon at end of three-codon sequence' {        
    run sed -E -f protein-translation.sed <<< 'AUGUUUUAA'
    assert_success
    assert_output 'Methionine Phenylalanine'
}

@test 'Translation stops if STOP codon in middle of three-codon sequence' {     
    run sed -E -f protein-translation.sed <<< 'UGGUAGUGG'
    assert_success
    assert_output 'Tryptophan'
}

@test 'Translation stops if STOP codon in middle of six-codon sequence' {       
    run sed -E -f protein-translation.sed <<< 'UGGUGUUAUUAAUGGUUU'
    assert_success
    assert_output 'Tryptophan Cysteine Tyrosine'
}

@test 'Sequence of two non-STOP codons does not translate to a STOP codon' {
    run sed -E -f protein-translation.sed <<< 'AUGAUG'
    assert_success
    assert_output 'Methionine Methionine'
}

@test 'Error case' {
    run sed -E -f protein-translation.sed <<< 'UGG---AUG'
    assert_failure
    assert_output 'Invalid codon'
}

@test "Non-existing codon can't translate" {
    run sed -E -f protein-translation.sed <<< 'AAA'
    assert_failure
    assert_output 'Invalid codon'
}

@test "Unknown amino acids, not part of a codon, can't translate" {
    run sed -E -f protein-translation.sed <<< 'XYZ'
    assert_failure
    assert_output 'Invalid codon'
}

@test "Incomplete RNA sequence can't translate" {
    run sed -E -f protein-translation.sed <<< 'AUGU'
    assert_failure
    assert_output 'Invalid codon'
}

@test 'Incomplete RNA sequence can translate if valid until a STOP codon' {
    run sed -E -f protein-translation.sed <<< 'UUCUUCUAAUGGU'
    assert_success
    assert_output 'Phenylalanine Phenylalanine'
}
