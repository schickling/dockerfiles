#! /bin/sh

set -e

if [ "${S3_ACCESS_KEY_ID}" == "**None**" ]; then
  echo "You need to set the S3_ACCESS_KEY_ID environment variable."
  exit 1
fi

if [ "${S3_SECRET_ACCESS_KEY}" == "**None**" ]; then
  echo "You need to set the S3_SECRET_ACCESS_KEY environment variable."
  exit 1
fi

if [ "${S3_BUCKET}" == "**None**" ]; then
  echo "You need to set the S3_BUCKET environment variable."
  exit 1
fi

if [ "${MYSQL_HOST}" == "**None**" ]; then
  echo "You need to set the MYSQL_HOST environment variable."
  exit 1
fi

if [ "${MYSQL_USER}" == "**None**" ]; then
  echo "You need to set the MYSQL_USER environment variable."
  exit 1
fi

if [ "${MYSQL_PASSWORD}" == "**None**" ]; then
  echo "You need to set the MYSQL_PASSWORD environment variable or link to a container named MYSQL."
  exit 1
fi

# env vars needed for aws tools
export AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$S3_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=$S3_REGION

MYSQL_HOST_OPTS="-h $MYSQL_HOST -P $MYSQL_PORT -u$MYSQL_USER -p$MYSQL_PASSWORD"
DUMP_START_TIME=$(date +"%Y-%m-%dT%H%M%SZ")

copy_s3 () {
  SRC_FILE=$1
  DEST_FILE=$2

  echo "Uploading ${DEST_FILE} on S3..."

  cat $SRC_FILE | aws s3 cp - s3://$S3_BUCKET/$S3_PREFIX/$DEST_FILE

  if [ $? != 0 ]; then
    >&2 echo "Error uploading ${DEST_FILE} on S3"
  fi

  rm $SRC_FILE
}

if [ "${MYSQLDUMP_DATABASES}" == "*ALL_IN_ONE*" ]; then
  echo "Creating dump of all databases from ${MYSQL_HOST}..."

  DUMP_FILE="/tmp/dump.sql.gz"
  mysqldump $MYSQL_HOST_OPTS $MYSQLDUMP_OPTIONS --all-databases | gzip > $DUMP_FILE

  if [ $? == 0 ]; then
    S3_FILE="${DUMP_START_TIME}.${DB}.sql.gz"

    copy_s3 $DUMP_FILE $S3_FILE
  else
    >&2 echo "Error creating dump of all databases"
  fi
elif [ "${MYSQLDUMP_DATABASES}" == "*ALL*" ]; then
  echo "Mysql options ${MYSQL_HOST_OPTS}";
  DATABASES=`mysql $MYSQL_HOST_OPTS -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema|mysql)"`

  for DB in $DATABASES; do
    echo "Creating dump of ${DB} database from ${MYSQL_HOST}..."

    DUMP_FILE="/tmp/${DB}.sql.gz"

    mysqldump $MYSQL_HOST_OPTS $MYSQLDUMP_OPTIONS --databases $DB | gzip > $DUMP_FILE

    if [ $? == 0 ]; then
      S3_FILE="${DUMP_START_TIME}.${DB}.sql.gz"

      copy_s3 $DUMP_FILE $S3_FILE
    else
      >&2 echo "Error creating dump of ${DB}"
    fi
  done

else
  for DB in $MYSQLDUMP_DATABASES; do
    echo "Creating dump of ${DB} database from ${MYSQL_HOST}..."

    DUMP_FILE="/tmp/${DB}.sql.gz"

    mysqldump $MYSQL_HOST_OPTS $MYSQLDUMP_OPTIONS --databases $DB | gzip > $DUMP_FILE

    if [ $? == 0 ]; then
      S3_FILE="${DUMP_START_TIME}.${DB}.sql.gz"

      copy_s3 $DUMP_FILE $S3_FILE
    else
      >&2 echo "Error creating dump of database ${DB}"
    fi
  done
fi

echo "SQL backup finished"
