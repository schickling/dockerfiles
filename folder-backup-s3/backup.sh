#! /bin/sh

set -e

if [ "${DATA_PATH}" == "**None**" ]; then
  echo "Warning: You did not set the DATA_PATH environment variable."
fi

if [ "${S3_ACCESS_KEY_ID}" == "**None**" ]; then
  echo "Warning: You did not set the S3_ACCESS_KEY_ID environment variable."
fi

if [ "${S3_SECRET_ACCESS_KEY}" == "**None**" ]; then
  echo "Warning: You did not set the S3_SECRET_ACCESS_KEY environment variable."
fi

if [ "${S3_BUCKET}" == "**None**" ]; then
  echo "You need to set the S3_BUCKET environment variable."
  exit 1
fi

if [ "${S3_IAMROLE}" != "true" ]; then
  # env vars needed for aws tools - only if an IAM role is not used
  export AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY_ID
  export AWS_SECRET_ACCESS_KEY=$S3_SECRET_ACCESS_KEY
  export AWS_DEFAULT_REGION=$S3_REGION
fi

DUMP_START_TIME=$(date +"%Y-%m-%dT%H%M%SZ")

copy_s3 () {
  SRC_FILE=$1
  DEST_FILE=$2

  if [ "${S3_ENDPOINT}" == "**None**" ]; then
    AWS_ARGS=""
  else
    AWS_ARGS="--endpoint-url ${S3_ENDPOINT}"
  fi

  echo "Uploading ${DEST_FILE} on S3..."

  cat $SRC_FILE | aws $AWS_ARGS s3 cp - s3://$S3_BUCKET/$S3_PREFIX/$DEST_FILE

  if [ $? != 0 ]; then
    >&2 echo "Error uploading ${DEST_FILE} on S3"
  fi

  rm $SRC_FILE
}
deleteOld_s3 () {
  if [ "${S3_ENDPOINT}" == "**None**" ]; then
    AWS_ARGS=""
  else
    AWS_ARGS="--endpoint-url ${S3_ENDPOINT}"
  fi

  aws $AWS_ARGS s3 ls s3://$S3_BUCKET/$S3_PREFIX/ | while read -r line;

  do
    createDate=`echo $line|awk {'print $1" "$2'}`
    createDate=`date -d"$createDate" +%s`
    olderThan=`date -d"-${DELETE_OLDER_THAN}" +%s`
    if [[ $createDate -lt $olderThan ]]
      then 
        fileName=`echo $line|awk {'print $4'}`
        echo $fileName
        if [[ $fileName != "" ]]
          then
            aws $AWS_ARGS s3 rm s3://$S3_BUCKET/$S3_PREFIX/$fileName
            echo "Deleted ${fileName} on S3"
        fi
    fi
  done;
}
shouldDeleteOld_s3() {
 if [ $? == 0 ]; then
    if [ "${DELETE_OLDER_THAN}" != "**None**" ]; then
      deleteOld_s3 
    fi
  else
    >&2 echo "Error deleting s3 files older than ${DELETE_OLDER_THAN}"
  fi 
}

echo "Creating folder backup for ${DATA_PATH}..."

DUMP_FILE=/tmp/${DUMP_START_TIME}.backup.tar.gz
rm -rf /tmp/*.backup.tar.gz
tar -zcf $DUMP_FILE -C $DATA_PATH .

if [ $? == 0 ]; then
  S3_FILE="${DUMP_START_TIME}.backup.tar.gz"

  copy_s3 $DUMP_FILE $S3_FILE
else
  >&2 echo "Error creating dump of folder ${DATA_PATH}"
fi

shouldDeleteOld_s3

echo "Folder backup finished"
