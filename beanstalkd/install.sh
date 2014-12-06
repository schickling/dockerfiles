#! /bin/bash

# exit if a command fails
set -e

version="1.10"

# install curl (needed to install rust)
apt-get update && apt-get install -y curl build-essential

# download
curl -sL https://github.com/kr/beanstalkd/archive/v$version.tar.gz | tar xvz -C /tmp

# build and install
cd /tmp/beanstalkd-$version
make
cp beanstalkd /usr/bin

# cleanup package manager
apt-get remove --purge -y curl build-essential && apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
