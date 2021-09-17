#! /bin/bash

# exit if a command fails
set -eo pipefail

# install full texlive distribution
apt-get update && apt-get install -y texlive-full

# cleanup package manager
apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
mkdir /source
