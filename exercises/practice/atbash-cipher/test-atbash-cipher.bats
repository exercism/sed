#!/usr/bin/env bats
load bats-extra

# The tests are divided into two groups: ,
# * Encoding from English to atbash-cipher cipher,
# * Decoding from atbash-cipher cipher to all-lowercase-mashed-together English

## "Test encoding from English to atbash-cipher"

@test 'encode yes' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
encode
yes
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'bvh'
}

@test 'encode no' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
encode
no
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'ml'
}

@test 'encode OMG' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
encode
OMG
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'lnt'
}

@test 'encode spaces' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
encode
O M G
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'lnt'
}

@test 'encode mindblowingly' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
encode
mindblowingly
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'nrmwy oldrm tob'
}

@test 'encode numbers' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
encode
Testing,1 2 3, testing.
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'gvhgr mt123 gvhgr mt'
}

@test 'encode deep thought' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
encode
Truth is fiction.
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'gifgs rhurx grlm'
}

@test 'encode all the letters' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
encode
The quick brown fox jumps over the lazy dog.
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'
}

## Test decoding from atbash-cipher to English

@test 'decode exercism' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
decode
vcvix rhn
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'exercism'
}

@test 'decode a sentence' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
decode
zmlyh gzxov rhlug vmzhg vkkrm thglm v
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'anobstacleisoftenasteppingstone'
}

@test 'decode numbers' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
decode
gvhgr mt123 gvhgr mt
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'testing123testing'
}

@test 'decode all the letters' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
decode
gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'thequickbrownfoxjumpsoverthelazydog'
}

@test 'decode with too many spaces' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
decode
vc vix    r hn
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'exercism'
}

@test 'decode with no spaces' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input=$(cat <<END_INPUT
decode
zmlyhgzxovrhlugvmzhgvkkrmthglmv
END_INPUT
)
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'anobstacleisoftenasteppingstone'
}
