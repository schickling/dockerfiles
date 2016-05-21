#! /bin/sh

# exit if a command fails
set -e

apk update

# install pg_dump
apk add postgresql

# install s3 tools
apk add python py-pip
pip install awscli
apk del py-pip

# cleanup
rm -rf /var/cache/apk/*
