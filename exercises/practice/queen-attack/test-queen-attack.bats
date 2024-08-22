#!/usr/bin/env bats
load bats-extra

## Test creation of Queens with valid and invalid positions
@test 'queen with a valid position' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "create",
      "queen": {
        "position": {
          "row": 2,
          "column": 2
        }
      }
    }'
    expected=0
    run sed -E -f queen-attack.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'queen must have positive row' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "create",
      "queen": {
        "position": {
          "row": -2,
          "column": 2
        }
      }
    }'
    expected='{ "error": "row not positive" }'
    run sed -E -f queen-attack.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'queen must have row on board' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "create",
      "queen": {
        "position": {
          "row": 8,
          "column": 4
        }
      }
    }'
    expected='{ "error": "row not on board" }'
    run sed -E -f queen-attack.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'queen must have positive column' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "create",
      "queen": {
        "position": {
          "row": 2,
          "column": -2
        }
      }
    }'
    expected='{ "error": "column not positive" }'
    run sed -E -f queen-attack.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'queen must have column on board' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "create",
      "queen": {
        "position": {
          "row": 4,
          "column": 8
        }
      }
    }'
    expected='{ "error": "column not on board" }'
    run sed -E -f queen-attack.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

## Test the ability of one queen to attack another
@test 'cannot attack' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "canAttack",
      "white_queen": {
        "position": {
          "row": 2,
          "column": 4
        }
      },
      "black_queen": {
        "position": {
          "row": 6,
          "column": 6
        }
      }
    }'
    expected='false'
    run sed -E -f queen-attack.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can attack on same row' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "canAttack",
      "white_queen": {
        "position": {
          "row": 2,
          "column": 4
        }
      },
      "black_queen": {
        "position": {
          "row": 2,
          "column": 6
        }
      }
    }'
    expected='true'
    run sed -E -f queen-attack.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can attack on same column' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "canAttack",
      "white_queen": {
        "position": {
          "row": 4,
          "column": 5
        }
      },
      "black_queen": {
        "position": {
          "row": 2,
          "column": 5
        }
      }
    }'
    expected='true'
    run sed -E -f queen-attack.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can attack on first diagonal' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "canAttack",
      "white_queen": {
        "position": {
          "row": 2,
          "column": 2
        }
      },
      "black_queen": {
        "position": {
          "row": 0,
          "column": 4
        }
      }
    }'
    expected='true'
    run sed -E -f queen-attack.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can attack on second diagonal' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "canAttack",
      "white_queen": {
        "position": {
          "row": 2,
          "column": 2
        }
      },
      "black_queen": {
        "position": {
          "row": 3,
          "column": 1
        }
      }
    }'
    expected='true'
    run sed -E -f queen-attack.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can attack on third diagonal' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "canAttack",
      "white_queen": {
        "position": {
          "row": 2,
          "column": 2
        }
      },
      "black_queen": {
        "position": {
          "row": 1,
          "column": 1
        }
      }
    }'
    expected='true'
    run sed -E -f queen-attack.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'can attack on fourth diagonal' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "canAttack",
      "white_queen": {
        "position": {
          "row": 1,
          "column": 7
        }
      },
      "black_queen": {
        "position": {
          "row": 0,
          "column": 6
        }
      }
    }'
    expected='true'
    run sed -E -f queen-attack.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "canAttack",
      "white_queen": {
        "position": {
          "row": 4,
          "column": 1
        }
      },
      "black_queen": {
        "position": {
          "row": 2,
          "column": 5
        }
      }
    }'
    expected='false'
    run sed -E -f queen-attack.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
