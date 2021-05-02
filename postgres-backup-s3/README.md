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
  links:
    - postgres
  environment:
    SCHEDULE: '@daily'
    S3_REGION: region
    S3_ACCESS_KEY_ID: key
    S3_SECRET_ACCESS_KEY: secret
    S3_BUCKET: my-bucket
    S3_PREFIX: backup
    POSTGRES_DATABASES: dbname
    POSTGRES_USER: user
    POSTGRES_PASSWORD: password
    POSTGRES_EXTRA_OPTS: '--schema=public --blobs'
```
## Environment variables

- `POSTGRES_EXTRA_OPTS` pg_dump options (default: '')
- `POSTGRES_DATABASES` list of databases you want to backup *required*
- `POSTGRES_HOST` the postgres host *required*
- `POSTGRES_PORT` the postgres port (default: 5432)
- `POSTGRES_USER` the postgres user *required*
- `POSTGRES_PASSWORD` the mysql password *required*
- `POSTGRES_PASSWORD_FILE` path to file containing the postgres password; alternative to `POSTGRES_PASSWORD`
- `S3_ACCESS_KEY_ID` your AWS access key *required*
- `S3_ACCESS_KEY_ID_FILE` path to file containing your AWS access key; alternative to `S3_ACCESS_KEY_ID`
- `S3_SECRET_ACCESS_KEY` your AWS secret key *required*
- `S3_SECRET_ACCESS_KEY_FILE` path to file containing  your AWS secret key; alternative to `S3_SECRET_ACCESS_KEYs`
- `S3_BUCKET` your AWS S3 bucket path *required*
- `S3_PREFIX` path prefix in your bucket (default: 'backup')
- `S3_FILENAME` a consistent filename to overwrite with your backup.  If not set will use a timestamp.
- `S3_REGION` the AWS S3 bucket region (default: us-west-1)
- `S3_ENDPOINT` the AWS Endpoint URL, for S3 Compliant APIs such as [minio](https://minio.io) (default: none)
- `S3_S3V4` set to `yes` to enable AWS Signature Version 4, required for [minio](https://minio.io) servers (default: no)
- `SCHEDULE` backup schedule time, see explainatons below

### Automatic Periodic Backups

You can additionally set the `SCHEDULE` environment variable like `-e SCHEDULE="@daily"` to run the backup automatically.

More information about the scheduling can be found [here](http://godoc.org/github.com/robfig/cron#hdr-Predefined_schedules).

