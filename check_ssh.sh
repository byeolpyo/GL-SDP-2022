#!/usr/bin/env bash

TARGET="192.168.56.123"

ssh $TARGET exit 0

if [ $? -ne "0" ]; then
    echo "Target inaccessible"
else
    echo "Target accessible"
fi
