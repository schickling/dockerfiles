#! /bin/bash

# exit if a command fails
set -e

# install node & npm
apt-get update && apt-get install -y nodejs npm

# alias as node
ln -sf /usr/local/bin/nodejs /usr/local/bin/node

# cleanup package manager
apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
mkdir /source
