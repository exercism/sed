# Tests

## Running Tests

To run the tests, execute the following command:

```bash
bats test-<exercise-slug>.bats
```

### bats is implemented in bash

The bats file is a bash script, with some special functions recognized by the `bats` command.
You'll see some tests that look like

```bash
sed -E -f <exercise-slug>.sed <<< "$input"
```

That `<<<` syntax is a bash *Here String*.
It sends the string on the right-hand side into the standard input of the program on the left-hand side.
It is approximately the same as

```bash
echo "$input" | sed -E -f <exercise-slug>.sed
```

## Skipped tests

Solving an exercise means making all its tests pass.
By default, only one test (the first one) is executed when you run the tests.
This is intentional, as it allows you to focus on just making that one test pass.
Once it passes, you can enable the next test by commenting out or removing the

    [[ $BATS_RUN_SKIPPED == true ]] || skip

annotations prepending other tests.

## Overriding skips

To run all tests, including the ones with `skip` annotations, you can run:

```bash
BATS_RUN_SKIPPED=true bats test-<exercise-slug>.bats
```

or you can comment or delete the line:

```bash
[[ $BATS_RUN_SKIPPED == "true" ]] || skip
```

from the test file.
