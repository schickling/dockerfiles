#! /bin/sh

# exit if a command fails
set -eo pipefail

apk update

# install pg_dump
apk add postgresql-client

# install s3 tools
apk add aws-cli

# cleanup
rm -rf /var/cache/apk/*
