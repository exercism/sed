#!/usr/bin/env bats
load bats-extra

## Create a new clock with an initial time
@test 'on the hour' {
    #[[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":8,"minute":0}'
    expected='08:00'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'past the hour' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":11,"minute":9}'
    expected='11:09'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'midnight is zero hours' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":24,"minute":0}'
    expected='00:00'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'hour rolls over' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":25,"minute":0}'
    expected='01:00'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'hour rolls over continuously' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":100,"minute":0}'
    expected='04:00'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'sixty minutes is next hour' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":1,"minute":60}'
    expected='02:00'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'minutes roll over' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":0,"minute":160}'
    expected='02:40'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'minutes roll over continuously' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":0,"minute":1723}'
    expected='04:43'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'hour and minutes roll over' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":25,"minute":160}'
    expected='03:40'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'hour and minutes roll over continuously' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":201,"minute":3001}'
    expected='11:01'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'hour and minutes roll over to exactly midnight' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":72,"minute":8640}'
    expected='00:00'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'negative hour' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":-1,"minute":15}'
    expected='23:15'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'negative hour rolls over' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":-25,"minute":0}'
    expected='23:00'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'negative hour rolls over continuously' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":-91,"minute":0}'
    expected='05:00'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'negative minutes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":1,"minute":-40}'
    expected='00:20'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'negative minutes roll over' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":1,"minute":-160}'
    expected='22:20'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'negative minutes roll over continuously' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":1,"minute":-4820}'
    expected='16:40'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'negative sixty minutes is previous hour' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":2,"minute":-60}'
    expected='01:00'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'negative hour and minutes both roll over' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":-25,"minute":-160}'
    expected='20:20'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'negative hour and minutes both roll over continuously' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"create","hour":-121,"minute":-5810}'
    expected='22:10'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

## Add minutes
@test 'add minutes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"add","hour":10,"minute":0,"value":3}'
    expected='10:03'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'add no minutes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"add","hour":6,"minute":41,"value":0}'
    expected='06:41'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'add to next hour' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"add","hour":0,"minute":45,"value":40}'
    expected='01:25'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'add more than one hour' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"add","hour":10,"minute":0,"value":61}'
    expected='11:01'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'add more than two hours with carry' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"add","hour":0,"minute":45,"value":160}'
    expected='03:25'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'add across midnight' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"add","hour":23,"minute":59,"value":2}'
    expected='00:01'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'add more than one day (1500 min = 25 hrs)' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"add","hour":5,"minute":32,"value":1500}'
    expected='06:32'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'add more than two days' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"add","hour":1,"minute":1,"value":3500}'
    expected='11:21'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

## Subtract minutes
@test 'subtract minutes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"subtract","hour":10,"minute":3,"value":3}'
    expected='10:00'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'subtract to previous hour' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"subtract","hour":10,"minute":3,"value":30}'
    expected='09:33'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'subtract more than an hour' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"subtract","hour":10,"minute":3,"value":70}'
    expected='08:53'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'subtract across midnight' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"subtract","hour":0,"minute":3,"value":4}'
    expected='23:59'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'subtract more than two hours' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"subtract","hour":0,"minute":0,"value":160}'
    expected='21:20'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'subtract more than two hours with borrow' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"subtract","hour":6,"minute":15,"value":160}'
    expected='03:35'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'subtract more than one day (1500 min = 25 hrs)' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"subtract","hour":5,"minute":32,"value":1500}'
    expected='04:32'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'subtract more than two days' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{"property":"subtract","hour":2,"minute":20,"value":3000}'
    expected='00:20'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

## Compare two clocks for equality
@test 'clocks with same time' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 15, "minute": 37 },
      "clock2": { "hour": 15, "minute": 37 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks a minute apart' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 15, "minute": 36 },
      "clock2": { "hour": 15, "minute": 37 }
    }'
    expected='false'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks an hour apart' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 14, "minute": 37 },
      "clock2": { "hour": 15, "minute": 37 }
    }'
    expected='false'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks with hour overflow' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 10, "minute": 37 },
      "clock2": { "hour": 34, "minute": 37 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks with hour overflow by several days' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 3, "minute": 11 },
      "clock2": { "hour": 99, "minute": 11 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks with negative hour' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 22, "minute": 40 },
      "clock2": { "hour": -2, "minute": 40 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks with negative hour that wraps' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 17, "minute": 3 },
      "clock2": { "hour": -31, "minute": 3 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks with negative hour that wraps multiple times' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 13, "minute": 49 },
      "clock2": { "hour": -83, "minute": 49 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks with minute overflow' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 0, "minute": 1 },
      "clock2": { "hour": 0, "minute": 1441 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks with minute overflow by several days' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 2, "minute": 2 },
      "clock2": { "hour": 2, "minute": 4322 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks with negative minute' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 2, "minute": 40 },
      "clock2": { "hour": 3, "minute": -20 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks with negative minute that wraps' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 4, "minute": 10 },
      "clock2": { "hour": 5, "minute": -1490 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks with negative minute that wraps multiple times' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 6, "minute": 15 },
      "clock2": { "hour": 6, "minute": -4305 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks with negative hours and minutes' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 7, "minute": 32 },
      "clock2": { "hour": -12, "minute": -268 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'clocks with negative hours and minutes that wrap' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 18, "minute": 7 },
      "clock2": { "hour": -54, "minute": -11513 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}

@test 'full clock and zeroed clock' {
    [[ $BATS_RUN_SKIPPED == "true" ]] || skip
    input='{
      "property": "equal",
      "clock1": { "hour": 24, "minute": 0 },
      "clock2": { "hour": 0, "minute": 0 }
    }'
    expected='true'
    run sed -E -f clock.sed <<< "$input"
    assert_success
    assert_output "$expected"
}
