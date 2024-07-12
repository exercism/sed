#!/usr/bin/env bats
load bats-extra

@test 'no matches' {
    input='diaper hello world zombies pants'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects two anagrams #1' {
    input='master stream pigeon maters'
    expected='stream maters'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects two anagrams #2' {
    input='solemn lemons cherry melons'
    expected='lemons melons'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'does not detect anagram subsets' {
    input='good dog goody'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects anagram' {
    input='listen enlists google inlets banana'
    expected='inlets'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects three anagrams' {
    input='allergy gallery ballerina regally clergy largely leading'
    expected='gallery regally largely'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects multiple anagrams with different case' {
    input='nose Eons ONES'
    expected='Eons ONES'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'does not detect non-anagrams with identical checksum' {
    input='mass last'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects anagrams case-insensitively' {
    input='Orchestra cashregister Carthorse radishes'
    expected='Carthorse'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects anagrams using case-insensitive subject' {
    input='Orchestra cashregister carthorse radishes'
    expected='carthorse'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'detects anagrams using case-insensitive possible matches' {
    input='orchestra cashregister Carthorse radishes'
    expected='Carthorse'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'does not detect an anagram if the original word is repeated #1' {
    input='go go Go GO'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'does not detect an anagram if the original word is repeated #2' {
    input='go go Go GO'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'anagrams must use all letters exactly once' {
    input='tapper patter'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'words are not anagrams of themselves (case-insensitive)' {
    input='BANANA BANANA Banana banana'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'words are not anagrams of themselves' {
    input='BANANA BANANA'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'words are not anagrams of themselves even if letter case is partially different' {
    input='BANANA Banana'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'words are not anagrams of themselves even if letter case is completely different' {
    input='BANANA banana'
    expected=''
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'words other than themselves can be anagrams #1' {
    input='LISTEN Listen Silent LISTEN'
    expected='Silent'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'words other than themselves can be anagrams #2' {
    input='LISTEN LISTEN Silent'
    expected='Silent'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'handles case of greek letters' {
    input='ΑΒΓ ΒΓΑ ΒΓΔ γβα αβγ'
    expected='ΒΓΑ γβα'
    run sed -E -f anagram.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
