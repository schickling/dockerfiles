#! /bin/bash

# exit if a command fails
set -e

# install ruby 1.9.1
apt-get update && apt-get install -y ruby ruby-dev build-essential sqlite3 libsqlite3-dev

# install mailcatcher
gem install mailcatcher --no-ri --no-rdoc

# cleanup package manager
apt-get remove --purge -y build-essential ruby-dev libsqlite3-dev && apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

