#!/usr/bin/env bats
load bats-extra

@test 'empty lists' {
    list_one=''
    list_two=''
    expected='equal'
    run sed -E -f sublist.sed < <(cat <<EOT
$list_one

$list_two
EOT
        )
    assert_success
    assert_output "$expected"
}

@test 'empty list within non empty list' {
    list_one=''
    list_two="$(cat <<EOT
1
2
3
EOT
        )"
    expected='sublist'
    run sed -E -f sublist.sed < <(cat <<EOT
$list_one

$list_two
EOT
        )
    assert_success
    assert_output "$expected"
}

@test 'non empty list contains empty list' {
    list_one="$(cat <<EOT
1
2
3
EOT
        )"
    list_two=''
    expected='superlist'
    run sed -E -f sublist.sed < <(cat <<EOT
$list_one

$list_two
EOT
        )
    assert_success
    assert_output "$expected"
}

@test 'list equals itself' {
    list_one="$(cat <<EOT
1
2
3
EOT
        )"
    list_two="$(cat <<EOT
1
2
3
EOT
        )"
    expected='equal'
    run sed -E -f sublist.sed < <(cat <<EOT
$list_one

$list_two
EOT
        )
    assert_success
    assert_output "$expected"
}

@test 'different lists' {
    list_one="$(cat <<EOT
1
2
3
EOT
        )"
    list_two="$(cat <<EOT
2
3
4
EOT
        )"
    expected='unequal'
    run sed -E -f sublist.sed < <(cat <<EOT
$list_one

$list_two
EOT
        )
    assert_success
    assert_output "$expected"
}

@test 'false start' {
    list_one="$(cat <<EOT
1
2
5
EOT
        )"
    list_two="$(cat <<EOT
0
1
2
3
1
2
5
6
EOT
        )"
    expected='sublist'
    run sed -E -f sublist.sed < <(cat <<EOT
$list_one

$list_two
EOT
        )
    assert_success
    assert_output "$expected"
}

@test 'consecutive' {
    list_one="$(cat <<EOT
1
1
2
EOT
        )"
    list_two="$(cat <<EOT
0
1
1
1
2
1
2
EOT
        )"
    expected='sublist'
    run sed -E -f sublist.sed < <(cat <<EOT
$list_one

$list_two
EOT
        )
    assert_success
    assert_output "$expected"
}

@test 'sublist at start' {
    list_one="$(cat <<EOT
0
1
2
EOT
        )"
    list_two="$(cat <<EOT
0
1
2
3
4
5
EOT
        )"
    expected='sublist'
    run sed -E -f sublist.sed < <(cat <<EOT
$list_one

$list_two
EOT
        )
    assert_success
    assert_output "$expected"
}

@test 'sublist in middle' {
    list_one="$(cat <<EOT
2
3
4
EOT
        )"
    list_two="$(cat <<EOT
0
1
2
3
4
5
EOT
        )"
    expected='sublist'
    run sed -E -f sublist.sed < <(cat <<EOT
$list_one

$list_two
EOT
        )
    assert_success
    assert_output "$expected"
}

@test 'sublist at end' {
    list_one="$(cat <<EOT
3
4
5
EOT
        )"
    list_two="$(cat <<EOT
0
1
2
3
4
5
EOT
        )"
    expected='sublist'
    run sed -E -f sublist.sed < <(cat <<EOT
$list_one

$list_two
EOT
        )
    assert_success
    assert_output "$expected"
}

@test 'at start of superlist' {
    list_one="$(cat <<EOT
0
1
2
3
4
5
EOT
        )"
    list_two="$(cat <<EOT
0
1
2
EOT
        )"
    expected='superlist'
    run sed -E -f sublist.sed < <(cat <<EOT
$list_one

$list_two
EOT
        )
    assert_success
    assert_output "$expected"
}

@test 'in middle of superlist' {
    list_one="$(cat <<EOT
0
1
2
3
4
5
EOT
        )"
    list_two="$(cat <<EOT
2
3
EOT
        )"
    expected='superlist'
    run sed -E -f sublist.sed < <(cat <<EOT
$list_one

$list_two
EOT
        )
    assert_success
    assert_output "$expected"
}

@test 'at end of superlist' {
    list_one="$(cat <<EOT
0
1
2
3
4
5
EOT
        )"
    list_two="$(cat <<EOT
3
4
5
EOT
        )"
    input="$(cat <<EOT
$list_one

$list_two
EOT
        )"
    expected='superlist'
    run sed -E -f sublist.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'first list missing element from second list' {
    list_one="$(cat <<EOT
1
3
EOT
        )"
    list_two="$(cat <<EOT
1
2
3
EOT
        )"
    input="$(cat <<EOT
$list_one

$list_two
EOT
        )"
    expected='unequal'
    run sed -E -f sublist.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'second list missing element from first list' {
    list_one="$(cat <<EOT
1
2
3
EOT
        )"
    list_two="$(cat <<EOT
1
3
EOT
        )"
    input="$(cat <<EOT
$list_one

$list_two
EOT
        )"
    expected='unequal'
    run sed -E -f sublist.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'first list missing additional digits from second list' {
    list_one="$(cat <<EOT
1
2
EOT
        )"
    list_two="$(cat <<EOT
1
22
EOT
        )"
    input="$(cat <<EOT
$list_one

$list_two
EOT
        )"
    expected='unequal'
    run sed -E -f sublist.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'order matters to a list' {
    list_one="$(cat <<EOT
1
2
3
EOT
        )"
    list_two="$(cat <<EOT
3
2
1
EOT
        )"
    input="$(cat <<EOT
$list_one

$list_two
EOT
        )"
    expected='unequal'
    run sed -E -f sublist.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'same digits but different numbers' {
    list_one="$(cat <<EOT
1
0
1
EOT
        )"
    list_two="$(cat <<EOT
10
1
EOT
        )"
    input="$(cat <<EOT
$list_one

$list_two
EOT
        )"
    expected='unequal'
    run sed -E -f sublist.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
