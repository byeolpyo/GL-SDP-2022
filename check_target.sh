#!/usr/bin/env bash

TARGET="192.168.56.123"

if [ "$1" != "" ]; then
    TARGET="$1"
fi

ping "$TARGET" -c1 -t1 >/dev/null 2>&1
res=$?

if [ "$res" == 0 ]; then
    echo "Target reachable"
else
    echo "Target unreachable"
fi

exit $res
