#! /bin/sh

set -eo pipefail

echo "Running s3cmd ..."

if [ "${SCHEDULE}" = "**None**" ]; then
  s3cmd "$@"
else
  exec go-cron "$SCHEDULE" s3cmd "$@"
fi
