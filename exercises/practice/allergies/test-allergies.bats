#!/usr/bin/env bats
load bats-extra

@test 'not allergic to anything #1' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: eggs, score: 0'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic only to eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: eggs, score: 1'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to eggs and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: eggs, score: 3'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to something, but not eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: eggs, score: 2'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to everything #1' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: eggs, score: 255'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'not allergic to anything #2' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: peanuts, score: 0'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic only to peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: peanuts, score: 2'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to peanuts and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: peanuts, score: 7'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to something, but not peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: peanuts, score: 5'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to everything #2' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: peanuts, score: 255'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'not allergic to anything #3' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: shellfish, score: 0'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic only to shellfish' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: shellfish, score: 4'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to shellfish and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: shellfish, score: 14'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to something, but not shellfish' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: shellfish, score: 10'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to everything #3' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: shellfish, score: 255'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'not allergic to anything #4' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: strawberries, score: 0'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic only to strawberries' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: strawberries, score: 8'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to strawberries and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: strawberries, score: 28'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to something, but not strawberries' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: strawberries, score: 20'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to everything #4' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: strawberries, score: 255'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'not allergic to anything #5' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: tomatoes, score: 0'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic only to tomatoes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: tomatoes, score: 16'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to tomatoes and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: tomatoes, score: 56'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to something, but not tomatoes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: tomatoes, score: 40'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to everything #5' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: tomatoes, score: 255'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'not allergic to anything #6' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: chocolate, score: 0'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic only to chocolate' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: chocolate, score: 32'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to chocolate and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: chocolate, score: 112'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to something, but not chocolate' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: chocolate, score: 80'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to everything #6' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: chocolate, score: 255'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'not allergic to anything #7' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: pollen, score: 0'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic only to pollen' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: pollen, score: 64'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to pollen and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: pollen, score: 224'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to something, but not pollen' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: pollen, score: 160'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to everything #7' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: pollen, score: 255'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'not allergic to anything #8' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: cats, score: 0'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic only to cats' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: cats, score: 128'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to cats and something else' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: cats, score: 192'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to something, but not cats' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: cats, score: 64'
    expected='false'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'allergic to everything #8' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='item: cats, score: 255'
    expected='true'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'no allergies' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='score: 0'
    expected=''
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'just eggs' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='score: 1'
    expected='eggs'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'just peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='score: 2'
    expected='peanuts'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'just strawberries' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='score: 8'
    expected='strawberries'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'eggs and peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='score: 3'
    expected="$(cat <<EOT
eggs
peanuts
EOT
            )"
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'more than eggs but not peanuts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='score: 5'
    expected="$(cat <<EOT
eggs
shellfish
EOT
            )"
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'lots of stuff' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='score: 248'
    expected="$(cat <<EOT
strawberries
tomatoes
chocolate
pollen
cats
EOT
            )"
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'everything' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='score: 255'
    expected="$(cat <<EOT
eggs
peanuts
shellfish
strawberries
tomatoes
chocolate
pollen
cats
EOT
            )"
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'no allergen score parts' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='score: 509'
    expected="$(cat <<EOT
eggs
shellfish
strawberries
tomatoes
chocolate
pollen
cats
EOT
            )"
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'no allergen score parts without highest valid score' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='score: 257'
    expected='eggs'
    run sed -E -f allergies.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
