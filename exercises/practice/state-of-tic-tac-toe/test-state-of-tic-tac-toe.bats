#!/usr/bin/env bats
load bats-extra

## The quotes around art-ascii numbers are removed before passing the
## input to the program. They are just to ensure that whitespace is
## not accidentally removed.

## Won games
@test 'Finished game where X won via left column victory' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XOO"
"X  "
"X  "
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where X won via middle column victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"OXO"
" X "
" X "
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where X won via right column victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"OOX"
"  X"
"  X"
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where O won via left column victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"OXX"
"OX "
"O  "
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where O won via middle column victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XOX"
" OX"
" O "
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where O won via right column victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XXO"
" XO"
"  O"
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where X won via top row victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XXX"
"XOO"
"O  "
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where X won via middle row victory #1' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"O O"
"XXX"
" O "
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where X won via middle row victory #2' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"O  "
"XXX"
" O "
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where X won via bottom row victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
" OO"
"O X"
"XXX"
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where O won via top row victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"OOO"
"XXO"
"XX "
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where O won via middle row victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XX "
"OOO"
"X  "
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where O won via bottom row victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XOX"
" XX"
"OOO"
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where X won via falling diagonal victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XOO"
" X "
"  X"
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where X won via rising diagonal victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"O X"
"OX "
"X  "
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where O won via falling diagonal victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"OXX"
"OOX"
"X O"
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where O won via rising diagonal victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"  O"
" OX"
"OXX"
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where X won via a row and a column victory' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XXX"
"XOO"
"XOO"
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Finished game where X won via two diagonal victories' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XOX"
"OXO"
"XOX"
EOT
        )"
    expected='win'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

## Drawn games
@test 'Draw' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XOX"
"XXO"
"OXO"
EOT
        )"
    expected='draw'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Another draw' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XXO"
"OXX"
"XOO"
EOT
        )"
    expected='draw'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}


## Ongoing games
@test 'Ongoing game: one move in' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"   "
"X  "
"   "
EOT
        )"
    expected='ongoing'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Ongoing game: two moves in' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"O  "
" X "
"   "
EOT
        )"
    expected='ongoing'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'Ongoing game: five moves in' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"X  "
" XO"
"OX "
EOT
        )"
    expected='ongoing'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_success
    assert_output "$expected"
}


## Invalid boards
@test 'Invalid board: X went twice' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XX "
"   "
"   "
EOT
        )"
    expected='Wrong turn order: X went twice'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'Invalid board: O started' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"OOX"
"   "
"   "
EOT
        )"
    expected='Wrong turn order: O started'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'Invalid board: X won and O kept playing' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XXX"
"OOO"
"   "
EOT
        )"
    expected='Impossible board: game should have ended after the game was won'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'Invalid board: players kept playing after a win' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input="$(sed 's/"//g' <<EOT
"XXX"
"OOO"
"XOX"
EOT
        )"
    expected='Impossible board: game should have ended after the game was won'
    run sed -E -f state-of-tic-tac-toe.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}
