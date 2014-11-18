dockerfiles [![Build Status](https://travis-ci.org/schickling/dockerfiles.svg)](https://travis-ci.org/schickling/dockerfiles)
===========

Collection of lightweight and ready-to-use docker images

## Images

* **[Mailcatcher](https://github.com/schickling/dockerfiles/tree/master/mailcatcher)** - Extra small mailcatcher image
* **[Octave](https://github.com/schickling/dockerfiles/tree/master/octave)** - Lightweight ocatve development environment
* **[OpenCV](https://github.com/schickling/dockerfiles/tree/master/opencv)** - Lightweight ready-to use OpenCV image
* **[Rust](https://github.com/schickling/dockerfiles/tree/master/rust)** - Lightweight nightly Rust build including Cargo and GDB

## FAQ

##### Why do you use `install.sh` scripts instead of putting the commands in the `Dockerfile`?

Structuring an image this way keeps it much smaller.
