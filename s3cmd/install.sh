#! /bin/sh

# exit if a command fails
set -eo pipefail

# install s3cmd
apk update
apk add --no-cache python3 py-pip py-setuptools git ca-certificates
pip install python-magic
git clone https://github.com/s3tools/s3cmd.git /tmp/s3cmd
cd /tmp/s3cmd
python3 setup.py install
apk del git
rm -rf /tmp/s3cmd

# install go-cron
apk add --no-cache curl
curl -L https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz | zcat > /usr/local/bin/go-cron
chmod u+x /usr/local/bin/go-cron
apk del curl
