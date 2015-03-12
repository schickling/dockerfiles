#! /bin/bash

# exit if a command fails
set -e

# install node & npm
apt-get update && apt-get install -y nodejs npm

# alias as node
ln -sf /usr/bin/nodejs /usr/bin/node

# install redis commander
npm install -g redis-commander

# cleanup package manager
apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
