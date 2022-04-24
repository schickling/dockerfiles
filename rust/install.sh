#! /bin/bash

# exit if a command fails
set -eo pipefail

# install curl (needed to install rust)
apt-get update && apt-get install -y curl gdb

# install rust + cargo nightly
curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly

# cleanup package manager
apt-get remove --purge -y curl && apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
mkdir /source
