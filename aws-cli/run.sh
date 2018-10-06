#! /bin/sh

set -e

echo "Running s3cmd ..."

if [ "${SCHEDULE}" = "**None**" ]; then
    aws "$@"
else
    exec go-cron "$SCHEDULE" aws "$@"
fi
