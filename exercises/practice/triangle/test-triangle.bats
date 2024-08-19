#!/usr/bin/env bats
load bats-extra

## equilateral triangle
@test 'all sides are equal - equilateral' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "equilateral", "sides": [2, 2, 2] }'
    expected='true'
    run sed -E -f triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'any side is unequal - equilateral' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "equilateral", "sides": [2, 3, 2] }'
    expected='false'
    run sed -E -f triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'no sides are equal - equilateral' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "equilateral", "sides": [5, 4, 6] }'
    expected='false'
    run sed -E -f triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'all zero sides is not a triangle - equilateral' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "equilateral", "sides": [0, 0, 0] }'
    expected='error'
    run sed -E -f triangle.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

## isosceles triangle
@test 'last two sides are equal - isosceles' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "isosceles", "sides": [3, 4, 4] }'
    expected='true'
    run sed -E -f triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'first two sides are equal - isosceles' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "isosceles", "sides": [4, 4, 3] }'
    expected='true'
    run sed -E -f triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'first and last sides are equal - isosceles' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "isosceles", "sides": [4, 3, 4] }'
    expected='true'
    run sed -E -f triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'equilateral triangles are also isosceles - isosceles' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "isosceles", "sides": [4, 4, 4] }'
    expected='true'
    run sed -E -f triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'no sides are equal - isosceles' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "isosceles", "sides": [2, 3, 4] }'
    expected='false'
    run sed -E -f triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'first triangle inequality violation - isosceles' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "isosceles", "sides": [1, 1, 3] }'
    expected='error'
    run sed -E -f triangle.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'second triangle inequality violation - isosceles' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "isosceles", "sides": [1, 3, 1] }'
    expected='error'
    run sed -E -f triangle.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

@test 'third triangle inequality violation - isosceles' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "isosceles", "sides": [3, 1, 1] }'
    expected='error'
    run sed -E -f triangle.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}

## scalene triangle
@test 'no sides are equal - scalene' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "scalene", "sides": [5, 4, 6] }'
    expected='true'
    run sed -E -f triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'all sides are equal - scalene' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "scalene", "sides": [4, 4, 4] }'
    expected='false'
    run sed -E -f triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'first and second sides are equal - scalene' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "scalene", "sides": [4, 4, 3] }'
    expected='false'
    run sed -E -f triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'first and third sides are equal - scalene' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "scalene", "sides": [3, 4, 3] }'
    expected='false'
    run sed -E -f triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'second and third sides are equal - scalene' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "scalene", "sides": [4, 3, 3] }'
    expected='false'
    run sed -E -f triangle.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'may not violate triangle inequality - scalene' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "scalene", "sides": [7, 3, 2] }'
    expected='error'
    run sed -E -f triangle.sed <<< "$input"
    assert_failure
    assert_output "$expected"
}
