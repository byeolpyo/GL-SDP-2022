#!/usr/bin/env bash
check_ip()
{
    TARGET=$1
    ping "$TARGET" -c1 -t1 >/dev/null 2>&1
    res=$?

    if [ "$res" == 0 ]; then
        echo "$TARGET reachable"
    else
        echo "$TARGET unreachable"
    fi

    return $res
}
