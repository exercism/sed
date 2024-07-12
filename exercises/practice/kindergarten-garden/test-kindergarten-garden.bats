#!/usr/bin/env bats
load bats-extra

# partial garden
@test 'garden with single student' {
    diagram="$(cat <<EOT
RC
GG
EOT
        )"
    student='Alice'
    input="$(cat <<EOT
$diagram
$student
EOT
)"
    expected='radish clover grass grass'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'different garden with single student' {
    diagram="$(cat <<EOT
VC
RC
EOT
        )"
    student='Alice'
    input="$(cat <<EOT
$diagram
$student
EOT
        )"
    expected='violet clover radish clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'garden with two students' {
    diagram="$(cat <<EOT
VVCG
VVRC
EOT
           )"
    student='Bob'
    input="$(cat <<EOT
$diagram
$student
EOT
        )"
    expected='clover grass radish clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

# multiple students for the same garden with three students
@test "second student's garden" {
    diagram="$(cat <<EOT
VVCCGG
VVCCGG
EOT
        )"
    student='Bob'
    input="$(cat <<EOT
$diagram
$student
EOT
        )"
    expected='clover clover clover clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "third student's garden" {
    diagram="$(cat <<EOT
VVCCGG
VVCCGG
EOT
           )"
    student='Charlie'
    input="$(cat <<EOT
$diagram
$student
EOT
)"
    expected='grass grass grass grass'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

# full garden
@test "for Alice, first student's garden" {
    diagram="$(cat <<EOT
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
EOT
) "
    student='Alice'
    input="$(cat <<EOT
$diagram
$student
EOT
)"
    expected='violet radish violet radish'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "for Bob, second student's garden" {
    diagram="$(cat <<EOT
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
EOT
)"
    student='Bob'
    input="$(cat <<EOT
$diagram
$student
EOT
)"
    expected='clover grass clover clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Charlie' {
    diagram="$(cat <<EOT
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
EOT
           )"
    student='Charlie'
    input="$(cat <<EOT
$diagram
$student
EOT
)"
    expected='violet violet clover grass'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for David' {
    diagram="$(cat <<EOT
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
EOT
)"
    student='David'
    input="$(cat <<EOT
$diagram
$student
EOT
)"
    expected='radish violet clover radish'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Eve' {
    diagram="$(cat <<EOT
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
EOT
           )"
    student='Eve'
    input="$(cat <<EOT
$diagram
$student
EOT
)"
    expected='clover grass radish grass'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Fred' {
    diagram="$(cat <<EOT
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
EOT
)"
    student='Fred'
    input="$(cat <<EOT
$diagram
$student
EOT
)"
    expected='grass clover violet clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Ginny' {
    diagram="$(cat <<EOT
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
EOT
           )"
    student='Ginny'
    input="$(cat <<EOT
$diagram
$student
EOT
)"
    expected='clover grass grass clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Harriet' {
    diagram="$(cat <<EOT
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
EOT
)"
    student='Harriet'
    input="$(cat <<EOT
$diagram
$student
EOT
)"
    expected='violet radish radish violet'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Ileana' {
    diagram="$(cat <<EOT
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
EOT
           )"
    student='Ileana'
    input="$(cat <<EOT
$diagram
$student
EOT
)"
    expected='grass clover violet clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Joseph' {
    diagram="$(cat <<EOT
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
EOT
)"
    student='Joseph'
    input="$(cat <<EOT
$diagram
$student
EOT
)"
    expected='violet clover violet grass'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "for Kincaid, second to last student's garden" {
    diagram="$(cat <<EOT
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
EOT
           )"
    student='Kincaid'
    input="$(cat <<EOT
$diagram
$student
EOT
        )"
    expected='grass clover clover grass'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "for Larry, last student's garden" {
    diagram="$(cat <<EOT
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
EOT
      )"
    student='Larry'
    input="$(cat <<EOT
$diagram
$student
EOT
        )"
    expected='grass violet clover violet'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
