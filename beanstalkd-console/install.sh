#! /bin/bash

# exit if a command fails
set -e

# install curl (needed to install rust)
apt-get update && apt-get install -y curl

# download
curl -sL https://github.com/ptrofimov/beanstalk_console/archive/master.tar.gz | tar xvz -C /tmp
mv /tmp/beanstalk_console-master /source

# cleanup package manager
apt-get remove --purge -y curl && apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
