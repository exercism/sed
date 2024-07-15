#!/usr/bin/env bats
load bats-extra

# The quotes around art-ascii numbers are removed before passing the
# input to the program. They are just to ensure that whitespace is not
# accidentally removed.

@test 'Recognizes 0' {
    # [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
" _ "
"| |"
"|_|"
"   "
EOT
        )"
    expected='0'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Recognizes 1' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"   "
"  |"
"  |"
"   "
EOT
        )"
    expected='1'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Unreadable but correctly sized inputs return ?' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"   "
"  _"
"  |"
"   "
EOT
        )"
    expected='?'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Input with a number of lines that is not a multiple of four raises an error' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
" _ "
"| |"
"   "
EOT
        )"
    expected='Number of input lines is not a multiple of four'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'Input with a number of columns that is not a multiple of three raises an error' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"    "
"   |"
"   |"
"    "
EOT
        )"
    expected='Number of input columns is not a multiple of three'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'Recognizes 110101100' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"       _     _        _  _ "
"  |  || |  || |  |  || || |"
"  |  ||_|  ||_|  |  ||_||_|"
"                           "
EOT
        )"
    expected='110101100'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Garbled numbers in a string are replaced with ?' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"       _     _           _ "
"  |  || |  || |     || || |"
"  |  | _|  ||_|  |  ||_||_|"
"                           "
EOT
        )"
    expected='11?10?1?0'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Recognizes 2' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
" _ "
" _|"
"|_ "
"   "
EOT
        )"
    expected='2'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Recognizes 3' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
" _ "
" _|"
" _|"
"   "
EOT
        )"
    expected='3'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Recognizes 4' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"   "
"|_|"
"  |"
"   "
EOT
        )"
    expected='4'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Recognizes 5' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
" _ "
"|_ "
" _|"
"   "
EOT
        )"
    expected='5'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Recognizes 6' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
" _ "
"|_ "
"|_|"
"   "
EOT
        )"
    expected='6'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Recognizes 7' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
" _ "
"  |"
"  |"
"   "
EOT
        )"
    expected='7'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Recognizes 8' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
" _ "
"|_|"
"|_|"
"   "
EOT
        )"
    expected='8'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Recognizes 9' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
" _ "
"|_|"
" _|"
"   "
EOT
        )"
    expected='9'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Recognizes string of decimal numbers' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"    _  _     _  _  _  _  _  _ "
"  | _| _||_||_ |_   ||_||_|| |"
"  ||_  _|  | _||_|  ||_| _||_|"
"                              "
EOT
        )"
    expected='1234567890'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Numbers separated by empty lines are recognized. Lines are joined by commas.' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"    _  _ "
"  | _| _|"
"  ||_  _|"
"         "
"    _  _ "
"|_||_ |_ "
"  | _||_|"
"         "
" _  _  _ "
"  ||_||_|"
"  ||_| _|"
"         "
EOT
        )"
    expected='123,456,789'
    run sed -E -f ocr-numbers.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
