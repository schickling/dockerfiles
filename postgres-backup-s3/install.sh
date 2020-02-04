#! /bin/sh

# exit if a command fails
set -e


apk update

# install pg_dump
apk add postgresql-client

# install s3 tools
apk add python py2-pip
pip install awscli
apk del py2-pip

# install go-cron
apk add curl
curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz | zcat > /usr/local/bin/go-cron
chmod u+x /usr/local/bin/go-cron
apk del curl


# cleanup
rm -rf /var/cache/apk/*
