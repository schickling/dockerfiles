#! /bin/bash

# exit if a command fails
set -eo pipefail

# install node & npm
apt-get update && apt-get install -y nodejs npm

# install redis commander
npm install -g redis-commander

# cleanup package manager
apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
