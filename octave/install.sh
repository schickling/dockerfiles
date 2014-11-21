#! /bin/bash

# exit if a command fails
set -e

# install octave 3.6.2 (less needed as frontend)
apt-get update && apt-get install -y octave less

# cleanup package manager
apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
mkdir /source
