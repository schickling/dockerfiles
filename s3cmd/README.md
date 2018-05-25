# s3cmd
Lightweight wrapper around s3cmd

## Basic usage

```sh
$ docker run -v $(pwd):/s3 schickling/s3cmd sync . s3://my-bucket
```

## Environment variables

- SCHEDULE backup schedule time, see explainatons below

## Automatic Periodic Backups

You can additionally set the SCHEDULE environment variable like -e SCHEDULE="@daily" to run the backup automatically.
More information about the scheduling can be found [here](http://godoc.org/github.com/robfig/cron#hdr-Predefined_schedules).

### `s3cmd` documentation

See [here](http://s3tools.org/usage) for the documentation.
