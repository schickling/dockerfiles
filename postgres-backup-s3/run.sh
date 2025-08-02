#! /bin/sh

set -eo pipefail

if [ "${S3_S3V4}" = "yes" ]; then
    aws configure set default.s3.signature_version s3v4
fi

if [ "${SCHEDULE}" = "**None**" ]; then
  sh backup.sh
else
  echo -e "SHELL=/bin/sh\n${SCHEDULE} root /bin/sh /backup.sh" > /etc/crontabs/root
  exec go-crond /etc/crontabs/root
fi
