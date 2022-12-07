#!/usr/bin/env bash

SCRIPT_NAME="top_df_local.sh"
REMOTE_USERNAME="dev"
REMOTE_IP="192.168.56.123"
TMP_FILENAME="top_df_tmp"

scp "$SCRIPT_NAME" "${REMOTE_USERNAME}@${REMOTE_IP}:"

# save output of the script to a temporary file to prevent time mismatch between machines
ssh "${REMOTE_USERNAME}@${REMOTE_IP}" "./${SCRIPT_NAME} > $TMP_FILENAME"
scp "${REMOTE_USERNAME}@${REMOTE_IP}:$TMP_FILENAME" $TMP_FILENAME
ssh "${REMOTE_USERNAME}@${REMOTE_IP}" "rm $TMP_FILENAME"

REMOTE_LOG_DIRNAME="$(cat $TMP_FILENAME | rev | cut -f 1 -d " " | cut -f 1 -d "/" | rev)"

rm $TMP_FILENAME

scp -r "${REMOTE_USERNAME}@${REMOTE_IP}:${REMOTE_LOG_DIRNAME}" "${REMOTE_LOG_DIRNAME}"