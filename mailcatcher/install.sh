#! /bin/bash

# exit if a command fails
set -e

# install dependencies
apt-get update && apt-get install -y build-essential sqlite3 libsqlite3-dev

# install mailcatcher
gem install mailcatcher -v 0.6.5 --no-ri --no-rdoc

# cleanup package manager
apt-get remove --purge -y build-essential libsqlite3-dev && apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

