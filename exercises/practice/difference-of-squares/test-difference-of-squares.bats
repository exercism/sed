#!/usr/bin/env bats
load bats-extra

## Square the sum of the numbers up to the given number
@test 'square of sum 1' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='property: squareOfSum, number: 1'
    expected=1
    run sed -E -f difference-of-squares.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'square of sum 5' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='property: squareOfSum, number: 5'
    expected=225
    run sed -E -f difference-of-squares.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'square of sum 9' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='property: squareOfSum, number: 9'
    expected=2025
    run sed -E -f difference-of-squares.sed <<< "$input"
    assert_success
    assert_output $expected
}
@test 'square of sum 13' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='property: squareOfSum, number: 13'
    expected=8281
    run sed -E -f difference-of-squares.sed <<< "$input"
    assert_success
    assert_output $expected
}

## Sum the squares of the numbers up to the given number
@test 'sum of squares 1' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='property: sumOfSquares, number: 1'
    expected=1
    run sed -E -f difference-of-squares.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'sum of squares 5' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='property: sumOfSquares, number: 5'
    expected=55
    run sed -E -f difference-of-squares.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'sum of squares 9' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='property: sumOfSquares, number: 9'
    expected=285
    run sed -E -f difference-of-squares.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'sum of squares 13' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='property: sumOfSquares, number: 13'
    expected=819
    run sed -E -f difference-of-squares.sed <<< "$input"
    assert_success
    assert_output $expected
}

## Subtract sum of squares from square of sums
@test 'difference of squares 1' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='property: differenceOfSquares, number: 1'
    expected=0
    run sed -E -f difference-of-squares.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'difference of squares 5' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='property: differenceOfSquares, number: 5'
    expected=170
    run sed -E -f difference-of-squares.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'difference of squares 9' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='property: differenceOfSquares, number: 9'
    expected=1740
    run sed -E -f difference-of-squares.sed <<< "$input"
    assert_success
    assert_output $expected
}

@test 'difference of squares 13' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='property: differenceOfSquares, number: 13'
    expected=7462
    run sed -E -f difference-of-squares.sed <<< "$input"
    assert_success
    assert_output $expected
}
