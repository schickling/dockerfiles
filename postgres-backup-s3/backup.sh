#! /bin/sh

set -e
set -o pipefail

if [ -n "${POSTGRES_PASSWORD_FILE}" ]; then
  POSTGRES_PASSWORD=$(cat "$POSTGRES_PASSWORD_FILE")
  export POSTGRES_PASSWORD
fi

if [ -n "${S3_ACCESS_KEY_ID_FILE}" ]; then
  S3_ACCESS_KEY_ID=$(cat "$S3_ACCESS_KEY_ID_FILE")
  export S3_ACCESS_KEY_ID
fi

if [ -n "${S3_SECRET_ACCESS_KEY_FILE}" ]; then
  S3_SECRET_ACCESS_KEY=$(cat "$S3_SECRET_ACCESS_KEY_FILE")
  export S3_SECRET_ACCESS_KEY
fi

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

if [ "${POSTGRES_DATABASES}" = "**None**" ]; then
  echo "You need to set the POSTGRES_DATABASES environment variable."
  exit 1
fi

if [ "${POSTGRES_HOST}" = "**None**" ]; then
  if [ -n "${POSTGRES_PORT_5432_TCP_ADDR}" ]; then
    POSTGRES_HOST=$POSTGRES_PORT_5432_TCP_ADDR
    POSTGRES_PORT=$POSTGRES_PORT_5432_TCP_PORT
  else
    echo "You need to set the POSTGRES_HOST environment variable."
    exit 1
  fi
fi

if [ "${POSTGRES_USER}" = "**None**" ]; then
  echo "You need to set the POSTGRES_USER environment variable."
  exit 1
fi

if [ "${POSTGRES_PASSWORD}" = "**None**" ]; then
  echo "You need to set the POSTGRES_PASSWORD environment variable or link to a container named POSTGRES."
  exit 1
fi

if [ "${S3_ENDPOINT}" == "**None**" ]; then
  AWS_ARGS=""
else
  AWS_ARGS="--endpoint-url ${S3_ENDPOINT}"
fi

# env vars needed for aws tools
export AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$S3_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=$S3_REGION

export PGPASSWORD=$POSTGRES_PASSWORD

copy_s3 () {
  SRC_FILE=$1
  DEST_FILE=$2

  if [ "${S3_ENDPOINT}" == "**None**" ]; then
    AWS_ARGS=""
  else
    AWS_ARGS="--endpoint-url ${S3_ENDPOINT}"
  fi

  echo "Uploading ${DEST_FILE} to S3..."

  cat $SRC_FILE | aws $AWS_ARGS s3 cp - s3://$S3_BUCKET/$S3_PREFIX/$DEST_FILE

  if [ $? != 0 ]; then
    >&2 echo "Error uploading ${DEST_FILE} on S3"
  fi

  rm $SRC_FILE
}

POSTGRES_HOST_OPTS="-h $POSTGRES_HOST -p $POSTGRES_PORT -U $POSTGRES_USER $POSTGRES_EXTRA_OPTS"
DUMP_START_TIME=$(date +"%Y-%m-%dT%H%M%SZ")

for DB in "$POSTGRES_DATABASES"; do
  echo "Creating dump of ${DB} from ${POSTGRES_HOST}..."

  DUMP_FILE="/tmp/${DB}.sql.gz"
  
  pg_dump $POSTGRES_HOST_OPTS $DB | gzip > $DUMP_FILE

  if [ $? == 0 ]; then
    if [ "${S3_FILENAME}" == "**None**" ]; then
      S3_FILE="${DUMP_START_TIME}.${DB}.sql.gz"
    else
      S3_FILE="${S3_FILENAME}.${DB}.sql.gz"
    fi

    copy_s3 $DUMP_FILE $S3_FILE
  else
    >&2 echo "Error creating dump of ${DB}"
  fi
done

echo "SQL backup uploaded successfully"
