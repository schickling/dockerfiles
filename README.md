dockerfiles [![Build Status](https://travis-ci.org/schickling/dockerfiles.svg)](https://travis-ci.org/schickling/dockerfiles)
===========

Collection of lightweight and ready-to-use docker images

## Images

* **[Beanstalkd](https://github.com/schickling/dockerfiles/tree/master/beanstalkd)** - Lightweight image of the latest beanstalkd version
* **[Beanstalkd-Console](https://github.com/schickling/dockerfiles/tree/master/beanstalkd-console)** - Admin console for Beanstalk queue server
* **[Hugin](https://github.com/schickling/dockerfiles/tree/master/hugin)** - Hugin & Panorama tools
* **[Jekyll](https://github.com/schickling/dockerfiles/tree/master/jekyll)** - Lightweight jekyll working environment
* **[Latex](https://github.com/schickling/dockerfiles/tree/master/latex)** - Full texlive distribution
* **[Mailcatcher](https://github.com/schickling/dockerfiles/tree/master/mailcatcher)** - Extra small mailcatcher image
* **[NodeJS](https://github.com/schickling/dockerfiles/tree/master/nodejs)** - Minimal NodeJS + NPM image
* **[Octave](https://github.com/schickling/dockerfiles/tree/master/octave)** - Lightweight ocatve development environment
* **[OpenCV](https://github.com/schickling/dockerfiles/tree/master/opencv)** - Lightweight ready-to use OpenCV image
* **[Redis-Commander](https://github.com/schickling/dockerfiles/tree/master/redis-commander)** - Redis management tool
* **[Rust](https://github.com/schickling/dockerfiles/tree/master/rust)** - Lightweight nightly Rust build including Cargo and GDB

## FAQ

##### Why do you use `install.sh` scripts instead of putting the commands in the `Dockerfile`?

Structuring an image this way keeps it much smaller.
