#!/usr/bin/env bats
load bats-extra

@test 'fly' {
    start_verse=1
    end_verse=1
    expected=$(cat <<EOT
I know an old lady who swallowed a fly.
I don't know why she swallowed the fly. Perhaps she'll die.
EOT
            )
    run sed -E -f food-chain.sed <<< "$start_verse $end_verse"
    assert_success
    assert_output "$expected"
}

@test 'spider' {
    start_verse=2
    end_verse=2
    expected=$(cat <<EOT
I know an old lady who swallowed a spider.
It wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
EOT
            )
    run sed -E -f food-chain.sed <<< "$start_verse $end_verse"
    assert_success
    assert_output "$expected"
}

@test 'bird' {
    start_verse=3
    end_verse=3
    expected=$(cat <<EOT
I know an old lady who swallowed a bird.
How absurd to swallow a bird!
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
EOT
            )
    run sed -E -f food-chain.sed <<< "$start_verse $end_verse"
    assert_success
    assert_output "$expected"
}

@test 'cat' {
    start_verse=4
    end_verse=4
    expected=$(cat <<EOT
I know an old lady who swallowed a cat.
Imagine that, to swallow a cat!
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
EOT
            )
    run sed -E -f food-chain.sed <<< "$start_verse $end_verse"
    assert_success
    assert_output "$expected"
}

@test 'dog' {
    start_verse=5
    end_verse=5
    expected=$(cat <<EOT
I know an old lady who swallowed a dog.
What a hog, to swallow a dog!
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
EOT
            )
    run sed -E -f food-chain.sed <<< "$start_verse $end_verse"
    assert_success
    assert_output "$expected"
}

@test 'goat' {
    start_verse=6
    end_verse=6
    expected=$(cat <<EOT
I know an old lady who swallowed a goat.
Just opened her throat and swallowed a goat!
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
EOT
            )
    run sed -E -f food-chain.sed <<< "$start_verse $end_verse"
    assert_success
    assert_output "$expected"
}

@test 'cow' {
    start_verse=7
    end_verse=7
    expected=$(cat <<EOT
I know an old lady who swallowed a cow.
I don't know how she swallowed a cow!
She swallowed the cow to catch the goat.
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
EOT
            )
    run sed -E -f food-chain.sed <<< "$start_verse $end_verse"
    assert_success
    assert_output "$expected"
}

@test 'horse' {
    start_verse=8
    end_verse=8
    expected=$(cat <<EOT
I know an old lady who swallowed a horse.
She's dead, of course!
EOT
            )
    run sed -E -f food-chain.sed <<< "$start_verse $end_verse"
    assert_success
    assert_output "$expected"
}

@test 'multiple verses' {
    start_verse=1
    end_verse=3
    expected=$(cat <<EOT
I know an old lady who swallowed a fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a spider.
It wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a bird.
How absurd to swallow a bird!
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.
EOT
            )
    run sed -E -f food-chain.sed <<< "$start_verse $end_verse"
    assert_success
    assert_output "$expected"
}

@test 'full song' {
    start_verse=1
    end_verse=8
    expected=$(cat <<EOT
I know an old lady who swallowed a fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a spider.
It wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a bird.
How absurd to swallow a bird!
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a cat.
Imagine that, to swallow a cat!
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a dog.
What a hog, to swallow a dog!
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a goat.
Just opened her throat and swallowed a goat!
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a cow.
I don't know how she swallowed a cow!
She swallowed the cow to catch the goat.
She swallowed the goat to catch the dog.
She swallowed the dog to catch the cat.
She swallowed the cat to catch the bird.
She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.
She swallowed the spider to catch the fly.
I don't know why she swallowed the fly. Perhaps she'll die.

I know an old lady who swallowed a horse.
She's dead, of course!
EOT
            )
    run sed -E -f food-chain.sed <<< "$start_verse $end_verse"
    assert_success
    assert_output "$expected"
}
