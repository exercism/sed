v 4.9

/[^ACGU]/ {
    s/.*/Invalid codon/
    q 1
}

:loop
s/(^| )AUG/ Methionine /;         t loop
s/(^| )UUU|UUC/ Phenylalanine /;  t loop
s/(^| )UUA|UUG/ Leucine /;        t loop
s/(^| )UCU|UCC|UCA|UCG/ Serine /; t loop
s/(^| )UAU|UAC/ Tyrosine /;       t loop
s/(^| )UGU|UGC/ Cysteine /;       t loop
s/(^| )UGG/ Tryptophan /;         t loop

s/(UAA|UAG|UGA).*//

s/^\s//
s/\s\s+/ /g
s/\s$//

/\b[A-Z]{1,3}\b/ {
    s/.*/Invalid codon/
    q 1
}
