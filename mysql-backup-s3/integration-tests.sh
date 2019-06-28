#! /bin/sh

export S3_ACCESS_KEY_ID=123
export S3_SECRET_ACCESS_KEY=123
export S3_BUCKET=123
export MYSQL_HOST=123
export MYSQL_USER=123
export MYSQL_PASSWORD=123

OUT=$(/bin/bash backup.sh 2>&1)

if [ "$?" == "0" ]; then
    echo "Backup exit code was 0"
    exit 1
fi

EXPECTED="Creating dump for --all-databases from 123...
mysqldump: Got error: 2002: \"Can't connect to MySQL server on '123' (22)\" when trying to connect"

if [ "$OUT" != "$EXPECTED" ]; then
    echo "OUTPUT was '$OUT'"
    exit 1
fi

