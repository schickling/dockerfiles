#! /bin/sh

set -e

if [ "${S3_ACCESS_KEY_ID}" = "**None**" ]; then
  echo "You need to set the S3_ACCESS_KEY_ID environment variable."
  exit 1
fi

if [ "${S3_SECRET_ACCESS_KEY}" = "**None**" ]; then
  echo "You need to set the S3_SECRET_ACCESS_KEY environment variable."
  exit 1
fi

if [ "${S3_BUCKET}" = "**None**" ]; then
  echo "You need to set the S3_BUCKET environment variable."
  exit 1
fi

if [ -z "${MYSQL_HOST}" ]; then
  echo "You need to set the MYSQL_HOST environment variable."
  exit 1
fi

if [ -z "${MYSQL_USER}" ]; then
  echo "You need to set the MYSQL_USER environment variable."
  exit 1
fi

if [ -z "${MYSQL_PASSWORD}" ]; then
  echo "You need to set the MYSQL_PASSWORD environment variable or link to a container named MYSQL."
  exit 1
fi

# env vars needed for aws tools
export AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$S3_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=$S3_REGION

MYSQL_HOST_OPTS="-h $MYSQL_HOST --port $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD"

echo "Creating dump of ${MYSQLDUMP_DATABASE} database(s) from ${MYSQL_HOST}..."

mysqldump $MYSQL_HOST_OPTS $MYSQLDUMP_OPTIONS $MYSQLDUMP_DATABASE | gzip > dump.sql.gz

echo "Uploading dump to $S3_BUCKET"

cat dump.sql.gz | aws s3 cp - s3://$S3_BUCKET/$S3_PREFIX/$(date +"%Y")/$(date +"%m")/$(date +"%d").sql.gz || exit 2

echo "SQL backup uploaded successfully"
