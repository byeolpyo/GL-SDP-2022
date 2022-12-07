#!/usr/bin/env bash

TIMESTAMP="$(date +"%d%m_%H%M")"

COUNT="$(ls -al | grep "$TIMESTAMP" | wc -l)"

OUTPUT_DIRNAME="${TIMESTAMP}_${COUNT}"

mkdir "$OUTPUT_DIRNAME"

OUTPUT_FILENAME="$OUTPUT_DIRNAME/${TIMESTAMP}_${COUNT}"

echo "Saving logs to ${OUTPUT_FILENAME}"
top -b -n1 > "$OUTPUT_FILENAME"
df -h >> "$OUTPUT_FILENAME"