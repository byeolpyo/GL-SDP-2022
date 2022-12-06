#!/usr/bin/env bash

TARGET="$1"

# tu powinna byc domyslna wartosc

./check_target.sh "$TARGET"
res=$?

if [ "$res" != "0" ]; then
    exit 1
fi

ssh $TARGET "mkdir bin; mkdir tmp"
