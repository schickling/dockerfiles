#! /bin/bash

# exit if a command fails
set -e

# install curl (needed to install rust)
apt-get update && apt-get install -y curl gdb g++-multilib lib32stdc++6 libssl-dev libncurses5-dev

# install rust + cargo nightly
curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly

# cleanup package manager
apt-get remove --purge -y curl && apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
mkdir /source
