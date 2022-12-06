#!/usr/bin/env bash

if [ -z "$1" ]; then
    date > data.txt
else
    date > $1
fi
