#! /bin/sh

# exit if a command fails
set -eo pipefail

apk update
apk add openssl aws-cli 
apk add postgresql-client --repository=https://dl-cdn.alpinelinux.org/alpine/v3.18/main

# cleanup
rm -rf /var/cache/apk/*
