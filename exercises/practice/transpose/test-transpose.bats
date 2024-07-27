#!/usr/bin/env bats
load bats-extra

@test 'empty string' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=''
    expected=''
    run sed -E -f transpose.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'two characters in a row' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='A1'
    expected="$(cat <<EOT
A
1
EOT
        )"
    run sed -E -f transpose.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'two characters in a column' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
A
1
EOT
        )"
    expected='A1'
    run sed -E -f transpose.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'simple' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
ABC
123
EOT
        )"
    expected="$(cat <<EOT
A1
B2
C3
EOT
        )"
    run sed -E -f transpose.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'single line' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='Single line'
    expected="$(cat <<EOT
S
i
n
g
l
e

l
i
n
e
EOT
        )"
    run sed -E -f transpose.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'first line longer than second line' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
The fourth line.
The fifth line.
EOT
        )"
    expected="$(cat <<EOT
TT
hh
ee

ff
oi
uf
rt
th
h
 l
li
in
ne
e.
.
EOT
        )"
    run sed -E -f transpose.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'second line longer than first line' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
The first line.
The second line.
EOT
        )"
    expected="$(cat <<EOT
TT
hh
ee

fs
ie
rc
so
tn
 d
l
il
ni
en
.e
 .
EOT
        )"
    run sed -E -f transpose.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'mixed line length' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
The longest line.
A long line.
A longer line.
A line.
EOT
        )"
    expected="$(cat <<EOT
TAAA
h
elll
 ooi
lnnn
ogge
n e.
glr
ei
snl
tei
 .n
l e
i .
n
e
.
EOT
        )"
    run sed -E -f transpose.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'square' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
HEART
EMBER
ABUSE
RESIN
TREND
EOT
        )"
    expected="$(cat <<EOT
HEART
EMBER
ABUSE
RESIN
TREND
EOT
        )"
    run sed -E -f transpose.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'rectangle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
FRACTURE
OUTLINED
BLOOMING
SEPTETTE
EOT
        )"
    expected="$(cat <<EOT
FOBS
RULE
ATOP
CLOT
TIME
UNIT
RENT
EDGE
EOT
        )"
    run sed -E -f transpose.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'triangle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
T
EE
AAA
SSSS
EEEEE
RRRRRR
EOT
        )"
    expected="$(cat <<EOT
TEASER
 EASER
  ASER
   SER
    ER
     R
EOT
        )"
    run sed -E -f transpose.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'jagged triangle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(cat <<EOT
11
2
3333
444
555555
66666
EOT
        )"
    expected="$(cat <<EOT
123456
1 3456
  3456
  3 56
    56
    5
EOT
        )"
    run sed -E -f transpose.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
