#! /bin/bash

# exit if a command fails
set -e

# install curl (needed to install rust)
apt-get update && apt-get install -y curl

# download
mkdir /source
curl -sL https://github.com/ptrofimov/beanstalk_console/archive/master.tar.gz | tar xvz -C /source

# cleanup package manager
apt-get remove --purge -y curl && apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
