#! /bin/bash

# install octave 3.6.2
apt-get update && apt-get install -y octave

# cleanup package manager
apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
mkdir /source
