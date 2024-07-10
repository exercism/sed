#!/usr/bin/env bats
load bats-extra

@test 'zero pieces' {
    expected=''
    run sed -E -f proverb.sed <<< ''
    assert_success
    assert_output "$expected"
}

@test 'one piece' {
    expected=$(cat <<EOT
And all for the want of a nail.
EOT
            )
    run sed -E -f proverb.sed <<< 'nail'
    assert_success
    assert_output "$expected"
}

@test 'two pieces' {
    expected=$(cat <<EOT
For want of a nail the shoe was lost.
And all for the want of a nail.
EOT
            )
    run sed -E -f proverb.sed <<< 'nail shoe'
    assert_success
    assert_output "$expected"
}

@test 'three pieces' {
    expected=$(cat <<EOT
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
And all for the want of a nail.
EOT
            )
    run sed -E -f proverb.sed <<< 'nail shoe horse'
    assert_success
    assert_output "$expected"
}


@test 'full proverb' {
    expected=$(cat <<EOT
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.
EOT
            )
    run sed -E -f proverb.sed <<< 'nail shoe horse rider message battle kingdom'
    assert_success
    assert_output "$expected"
}

@test 'four pieces modernized' {
    expected=$(cat <<EOT
For want of a pin the gun was lost.
For want of a gun the soldier was lost.
For want of a soldier the battle was lost.
And all for the want of a pin.
EOT
            )
    run sed -E -f proverb.sed <<< 'pin gun soldier battle'
    assert_success
    assert_output "$expected"
}
