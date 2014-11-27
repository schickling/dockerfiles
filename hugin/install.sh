#! /bin/bash

# exit if a command fails
set -e

# install hugin & panotools
apt-get update && apt-get install -y hugin

# cleanup package manager
apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
mkdir /source
