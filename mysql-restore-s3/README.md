# mysql-restore-s3

Restore a MySQL backup from S3 to MySQL

## Warning

This will potentially put your database in a very bad state or complete destroy your data, be very careful.

## Limitations

This is made to restore a backup made from mysql-backup-s3, if you backup came from somewhere else please check your format.

* Your s3 bucket must only contain backups which you wish to restore - it will always grabs the 'latest' based on unix sort with no filtering, unless exact name provided
* They must be gzip encoded text sql files
* If your bucket has more than a 1000 files the latest may not be restore, only one s3 ls command is made

## Usage

Docker:
```sh
$ docker run -e S3_ACCESS_KEY_ID=key -e S3_SECRET_ACCESS_KEY=secret -e S3_BUCKET=my-bucket -e S3_PREFIX=backup -e MYSQL_USER=user -e MYSQL_PASSWORD=password -e MYSQL_HOST=localhost schickling/mysql-restore-s3
```

## Environment variables

- `MYSQL_HOST` the mysql host *required*
- `MYSQL_PORT` the mysql port (default: 3306)
- `MYSQL_USER` the mysql user *required*
- `MYSQL_PASSWORD` the mysql password *required*
- `MYSQL_OPTS` options to use when calling MySQL command (to set, e.g. encoding)
- `S3_ACCESS_KEY_ID` your AWS access key *required*
- `S3_SECRET_ACCESS_KEY` your AWS secret key *required*
- `S3_BUCKET` your AWS S3 bucket path *required*
- `S3_PREFIX` path prefix in your bucket (default: 'backup')
- `S3_FILENAME` filename from S3 used for backup. If not set, it will use the latest snapshot file.
- `S3_REGION` the AWS S3 bucket region (default: us-west-1)
- `S3_ENDPOINT` the AWS Endpoint URL, for S3 Compliant APIs such as [minio](https://minio.io) (default: none)
- `S3_S3V4` set to `yes` to enable AWS Signature Version 4, required for [minio](https://minio.io) servers (default: no)
