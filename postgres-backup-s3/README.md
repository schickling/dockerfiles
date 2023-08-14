# postgres-backup-s3

Backup PostgresSQL to S3 (supports periodic backups)

## Usage

Docker:
```sh
$ docker run -e S3_ACCESS_KEY_ID=key -e S3_SECRET_ACCESS_KEY=secret -e S3_BUCKET=my-bucket -e S3_PREFIX=backup -e POSTGRES_DATABASE=dbname -e POSTGRES_USER=user -e POSTGRES_PASSWORD=password -e POSTGRES_HOST=localhost schickling/postgres-backup-s3
```

Docker Compose:
```yaml
postgres:
  image: postgres
  environment:
    POSTGRES_USER: user
    POSTGRES_PASSWORD: password

pgbackups3:
  image: schickling/postgres-backup-s3
  depends_on:
    - postgres
  links:
    - postgres
  environment:
    SCHEDULE: '@daily'
    S3_REGION: region
    S3_ACCESS_KEY_ID: key
    S3_SECRET_ACCESS_KEY: secret
    S3_BUCKET: my-bucket
    S3_PREFIX: backup
    POSTGRES_BACKUP_ALL: "false"
    POSTGRES_HOST: host
    POSTGRES_DATABASE: dbname
    POSTGRES_USER: user
    POSTGRES_PASSWORD: password
    POSTGRES_EXTRA_OPTS: '--schema=public --blobs'
```

### Automatic Periodic Backups

You can additionally set the `SCHEDULE` environment variable like `-e SCHEDULE="@daily"` to run the backup automatically.

More information about the scheduling can be found [here](http://godoc.org/github.com/robfig/cron#hdr-Predefined_schedules).

### Backup File Name / Path
By default, if `POSTGRES_BACKUP_ALL` is true, the dump file will be put at `<S3_PREFIX=''>/all_<timestamp>.sql.gz`. When using `POSTGRES_DATABASE`, each database listed will be backed up to the object path `<S3_PREFIX=''>/<database>_<timestamp>.sql.gz`.

If you wish to make these filenames static, you can use the `S3_FILE_NAME` variable, which will change these formats to `<S3_PREFIX=''>/<S3_FILE_NAME>.sql.gz` or `<S3_PREFIX=''>/<S3_FILE_NAME>_<database>.sql.gz` accordingly.

### Backup All Databases

You can backup all available databases by setting `POSTGRES_BACKUP_ALL="true"`.

Single archive with the name `all_<timestamp>.sql.gz` will be uploaded to S3

### Endpoints for S3

An Endpoint is the URL of the entry point for an AWS web service or S3 Compitable Storage Provider.

You can specify an alternate endpoint by setting `S3_ENDPOINT` environment variable like `protocol://endpoint`

**Note:** S3 Compitable Storage Provider requires `S3_ENDPOINT` environment variable

### Encryption

You can additionally set the `ENCRYPTION_PASSWORD` environment variable like `-e ENCRYPTION_PASSWORD="superstrongpassword"` to encrypt the backup. It can be decrypted using `openssl aes-256-cbc -d -in backup.sql.gz.enc -out backup.sql.gz`.