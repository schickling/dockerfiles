#! /bin/sh

# exit if a command fails
set -e

# download
curl -sL https://github.com/ptrofimov/beanstalk_console/archive/master.tar.gz | tar xvz -C /tmp
mv /tmp/beanstalk_console-master /source

# remove tmp files
rm -rf /tmp/*
