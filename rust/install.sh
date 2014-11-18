#! /bin/bash

# exit if a command fails
set -e

triple=x86_64-unknown-linux-gnu

# install curl (needed to install rust)
apt-get update && apt-get install -y curl gdb g++-multilib lib32stdc++6 libssl-dev libncurses5-dev

# install rust
curl -sL https://static.rust-lang.org/dist/rust-nightly-$triple.tar.gz | tar xvz -C /tmp
/tmp/rust-nightly-$triple/install.sh

# install cargo
curl -sL https://static.rust-lang.org/cargo-dist/cargo-nightly-$triple.tar.gz | tar xvz -C /tmp
/tmp/cargo-nightly-$triple/install.sh

# cleanup package manager
apt-get remove --purge -y curl && apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
mkdir /source
