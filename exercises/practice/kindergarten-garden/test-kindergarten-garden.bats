#!/usr/bin/env bats
load bats-extra

# partial garden
@test 'garden with single student' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
RC
GG
END_DIAGRAM
)
    student='Alice'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='radish clover grass grass'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'different garden with single student' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VC
RC
END_DIAGRAM
)
    student='Alice'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='violet clover radish clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'garden with two students' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VVCG
VVRC
END_DIAGRAM
)
    student='Bob'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='clover grass radish clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

# multiple students for the same garden with three students
@test "second student's garden" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VVCCGG
VVCCGG
END_DIAGRAM
)
    student='Bob'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='clover clover clover clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "third student's garden" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VVCCGG
VVCCGG
END_DIAGRAM
)
    student='Charlie'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='grass grass grass grass'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

# full garden
@test "for Alice, first student's garden" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
END_DIAGRAM
)
    student='Alice'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='violet radish violet radish'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "for Bob, second student's garden" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
END_DIAGRAM
)
    student='Bob'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='clover grass clover clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Charlie' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
END_DIAGRAM
)
    student='Charlie'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='violet violet clover grass'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for David' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
END_DIAGRAM
)
    student='David'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='radish violet clover radish'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Eve' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
END_DIAGRAM
)
    student='Eve'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='clover grass radish grass'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Fred' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
END_DIAGRAM
)
    student='Fred'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='grass clover violet clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Ginny' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
END_DIAGRAM
)
    student='Ginny'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='clover grass grass clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Harriet' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
END_DIAGRAM
)
    student='Harriet'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='violet radish radish violet'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Ileana' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
END_DIAGRAM
)
    student='Ileana'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='grass clover violet clover'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'for Joseph' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
END_DIAGRAM
)
    student='Joseph'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='violet clover violet grass'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "for Kincaid, second to last student's garden" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
END_DIAGRAM
)
    student='Kincaid'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='grass clover clover grass'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test "for Larry, last student's garden" {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    diagram=$(cat <<END_DIAGRAM
VRCGVVRVCGGCCGVRGCVCGCGV
VRCCCGCRRGVCGCRVVCVGCGCV
END_DIAGRAM
)
    student='Larry'
    input=$(cat <<END_INPUT
$diagram
$student
END_INPUT
)
    expected='grass violet clover violet'
    run sed -E -f kindergarten-garden.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
