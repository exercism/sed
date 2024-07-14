#!/usr/bin/env bats
load bats-extra

## verse
## single verse

@test 'first generic verse' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    start_bottles=10
    take_down=1
    expected=$(cat <<END_EXPECTED
Ten green bottles hanging on the wall,
Ten green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be nine green bottles hanging on the wall.
END_EXPECTED
)
    run sed -E -f bottle-song.sed <<< "$start_bottles $take_down"
    assert_success
    assert_output "$expected"
}

@test 'last generic verse' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    start_bottles=3
    take_down=1
    expected=$(cat <<END_EXPECTED
Three green bottles hanging on the wall,
Three green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be two green bottles hanging on the wall.
END_EXPECTED
)
    run sed -E -f bottle-song.sed <<< "$start_bottles $take_down"
    assert_success
    assert_output "$expected"
}

@test 'verse with 2 bottles' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    start_bottles=2
    take_down=1
    expected=$(cat <<END_EXPECTED
Two green bottles hanging on the wall,
Two green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be one green bottle hanging on the wall.
END_EXPECTED
)
    run sed -E -f bottle-song.sed <<< "$start_bottles $take_down"
    assert_success
    assert_output "$expected"

}

@test 'verse with 1 bottle' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    start_bottles=1
    take_down=1
    expected=$(cat <<END_EXPECTED
One green bottle hanging on the wall,
One green bottle hanging on the wall,
And if one green bottle should accidentally fall,
There'll be no green bottles hanging on the wall.
END_EXPECTED
)
    run sed -E -f bottle-song.sed <<< "$start_bottles $take_down"
    assert_success
    assert_output "$expected"
}

## lyrics
## multiple verses

@test 'first two verses' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    start_bottles=10
    take_down=2
    expected=$(cat <<END_EXPECTED
Ten green bottles hanging on the wall,
Ten green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be nine green bottles hanging on the wall.

Nine green bottles hanging on the wall,
Nine green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be eight green bottles hanging on the wall.
END_EXPECTED
)
    run sed -E -f bottle-song.sed <<< "$start_bottles $take_down"
    assert_success
    assert_output "$expected"
}

@test 'last three verses' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    start_bottles=3
    take_down=3
    expected=$(cat <<END_EXPECTED
Three green bottles hanging on the wall,
Three green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be two green bottles hanging on the wall.

Two green bottles hanging on the wall,
Two green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be one green bottle hanging on the wall.

One green bottle hanging on the wall,
One green bottle hanging on the wall,
And if one green bottle should accidentally fall,
There'll be no green bottles hanging on the wall.
END_EXPECTED
)
    run sed -E -f bottle-song.sed <<< "$start_bottles $take_down"
    assert_success
    assert_output "$expected"
}

@test 'all verses' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    start_bottles=10
    take_down=10
    expected=$(cat <<END_EXPECTED
Ten green bottles hanging on the wall,
Ten green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be nine green bottles hanging on the wall.

Nine green bottles hanging on the wall,
Nine green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be eight green bottles hanging on the wall.

Eight green bottles hanging on the wall,
Eight green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be seven green bottles hanging on the wall.

Seven green bottles hanging on the wall,
Seven green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be six green bottles hanging on the wall.

Six green bottles hanging on the wall,
Six green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be five green bottles hanging on the wall.

Five green bottles hanging on the wall,
Five green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be four green bottles hanging on the wall.

Four green bottles hanging on the wall,
Four green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be three green bottles hanging on the wall.

Three green bottles hanging on the wall,
Three green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be two green bottles hanging on the wall.

Two green bottles hanging on the wall,
Two green bottles hanging on the wall,
And if one green bottle should accidentally fall,
There'll be one green bottle hanging on the wall.

One green bottle hanging on the wall,
One green bottle hanging on the wall,
And if one green bottle should accidentally fall,
There'll be no green bottles hanging on the wall.
END_EXPECTED
)
    run sed -E -f bottle-song.sed <<< "$start_bottles $take_down"
    assert_success
    assert_output "$expected"
}
