#!/usr/bin/env bats
load bats-extra

# The tests are divided into two groups: ,
# * Encoding from English to atbash-cipher cipher,
# * Decoding from atbash-cipher cipher to all-lowercase-mashed-together English

## "Test encoding from English to atbash-cipher"

@test 'encode yes' {
    input=$(cat <<EOT
encode
yes
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'bvh'
}

@test 'encode no' {
    input=$(cat <<EOT
encode
no
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'ml'
}

@test 'encode OMG' {
    input=$(cat <<EOT
encode
OMG
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'lnt'
}

@test 'encode spaces' {
    input=$(cat <<EOT
encode
O M G
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'lnt'
}

@test 'encode mindblowingly' {
    input=$(cat <<EOT
encode
mindblowingly
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'nrmwy oldrm tob'
}

@test 'encode numbers' {
    input=$(cat <<EOT
encode
Testing,1 2 3, testing.
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'gvhgr mt123 gvhgr mt'
}

@test 'encode deep thought' {
    input=$(cat <<EOT
encode
Truth is fiction.
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'gifgs rhurx grlm'
}

@test 'encode all the letters' {
    input=$(cat <<EOT
encode
The quick brown fox jumps over the lazy dog.
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'
}

## Test decoding from atbash-cipher to English

@test 'decode exercism' {
    input=$(cat <<EOT
decode
vcvix rhn
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'exercism'
}

@test 'decode a sentence' {
    input=$(cat <<EOT
decode
zmlyh gzxov rhlug vmzhg vkkrm thglm v
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'anobstacleisoftenasteppingstone'
}

@test 'decode numbers' {
    input=$(cat <<EOT
decode
gvhgr mt123 gvhgr mt
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'testing123testing'
}

@test 'decode all the letters' {
    input=$(cat <<EOT
decode
gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'thequickbrownfoxjumpsoverthelazydog'
}

@test 'decode with too many spaces' {
    input=$(cat <<EOT
decode
vc vix    r hn
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'exercism'
}

@test 'decode with no spaces' {
    input=$(cat <<EOT
decode
zmlyhgzxovrhlugvmzhgvkkrmthglmv
EOT
         )
    run sed -E -f atbash-cipher.sed <<< "$input"
    assert_success
    assert_output 'anobstacleisoftenasteppingstone'
}
