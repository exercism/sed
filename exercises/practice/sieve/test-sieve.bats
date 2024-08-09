#!/usr/bin/env bats
load bats-extra

@test 'no primes under two' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "primes", "limit": 1 }'
    expected=''
    run sed -E -f sieve.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'find first prime' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "primes", "limit": 2 }'
    expected=2
    run sed -E -f sieve.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'find primes up to 10' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "primes", "limit": 10 }'
    expected='2, 3, 5, 7'
    run sed -E -f sieve.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'limit is prime' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "primes", "limit": 13 }'
    expected='2, 3, 5, 7, 11, 13'
    run sed -E -f sieve.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'find primes up to 200' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "primes", "limit": 200 }'
    expected="$(cat <<EOT
  2,   3,   5,   7,  11,  13,  17,  19,  23,  29,  31,  37,  41,  43,
 47,  53,  59,  61,  67,  71,  73,  79,  83,  89,  97, 101, 103, 107,
109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181,
191, 193, 197, 199
EOT
        )"

    run sed -E -f sieve.sed <<< "$input"
    assert_success
    assert_output "$expected"
}


@test 'find primes up to 500' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{ "property": "primes", "limit": 500 }'
    expected="$(cat <<EOT
  2,   3,   5,   7,  11,  13,  17,  19,  23,  29,  31,  37,  41,  43,
 47,  53,  59,  61,  67,  71,  73,  79,  83,  89,  97, 101, 103, 107,
109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181,
191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263,
269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349,
353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433,
439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499
EOT
        )"
    run sed -E -f sieve.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
