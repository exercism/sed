#!/usr/bin/env bats
load bats-extra

@test 'zero pieces' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=''
    run sed -E -f proverb.sed <<< ''
    assert_success
    assert_output "$expected"
}

@test 'one piece' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END_EXPECTED
And all for the want of a nail.
END_EXPECTED
)
    run sed -E -f proverb.sed <<< 'nail'
    assert_success
    assert_output "$expected"
}

@test 'two pieces' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END_EXPECTED
For want of a nail the shoe was lost.
And all for the want of a nail.
END_EXPECTED
)
    run sed -E -f proverb.sed <<< 'nail shoe'
    assert_success
    assert_output "$expected"
}

@test 'three pieces' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END_EXPECTED
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
And all for the want of a nail.
END_EXPECTED
)
    run sed -E -f proverb.sed <<< 'nail shoe horse'
    assert_success
    assert_output "$expected"
}


@test 'full proverb' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END_EXPECTED
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.
END_EXPECTED
)
    run sed -E -f proverb.sed <<< 'nail shoe horse rider message battle kingdom'
    assert_success
    assert_output "$expected"
}

@test 'four pieces modernized' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    expected=$(cat <<END_EXPECTED
For want of a pin the gun was lost.
For want of a gun the soldier was lost.
For want of a soldier the battle was lost.
And all for the want of a pin.
END_EXPECTED
)
    run sed -E -f proverb.sed <<< 'pin gun soldier battle'
    assert_success
    assert_output "$expected"
}
