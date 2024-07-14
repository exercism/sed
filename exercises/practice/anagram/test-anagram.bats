#!/usr/bin/env bats
load bats-extra

@test 'no matches' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='diaper hello world zombies pants'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects two anagrams #1' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='master stream pigeon maters'
    expected='stream maters'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects two anagrams #2' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='solemn lemons cherry melons'
    expected='lemons melons'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'does not detect anagram subsets' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='good dog goody'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects anagram' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='listen enlists google inlets banana'
    expected='inlets'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects three anagrams' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='allergy gallery ballerina regally clergy largely leading'
    expected='gallery regally largely'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects multiple anagrams with different case' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='nose Eons ONES'
    expected='Eons ONES'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'does not detect non-anagrams with identical checksum' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='mass last'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects anagrams case-insensitively' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='Orchestra cashregister Carthorse radishes'
    expected='Carthorse'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects anagrams using case-insensitive subject' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='Orchestra cashregister carthorse radishes'
    expected='carthorse'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects anagrams using case-insensitive possible matches' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='orchestra cashregister Carthorse radishes'
    expected='Carthorse'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'does not detect an anagram if the original word is repeated #1' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='go go Go GO'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'does not detect an anagram if the original word is repeated #2' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='go go Go GO'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'anagrams must use all letters exactly once' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='tapper patter'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'words are not anagrams of themselves (case-insensitive)' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='BANANA BANANA Banana banana'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'words are not anagrams of themselves' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='BANANA BANANA'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'words are not anagrams of themselves even if letter case is partially different' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='BANANA Banana'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'words are not anagrams of themselves even if letter case is completely different' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='BANANA banana'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'words other than themselves can be anagrams #1' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='LISTEN Listen Silent LISTEN'
    expected='Silent'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'words other than themselves can be anagrams #2' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='LISTEN LISTEN Silent'
    expected='Silent'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'handles case of greek letters' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='ΑΒΓ ΒΓΑ ΒΓΔ γβα αβγ'
    expected='ΒΓΑ γβα'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
