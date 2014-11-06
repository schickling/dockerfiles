FROM debian:wheezy
MAINTAINER Johannes Schickling "schickling.j@gmail.com"

# install curl (needed to install rust)
RUN apt-get update && apt-get install -y curl gdb gcc make

# install rust & cargo
RUN curl -s https://static.rust-lang.org/rustup.sh | sh

# cleanup package manager
RUN apt-get remove --purge -y curl && apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
RUN mkdir -p /usr/src/app

VOLUME ["/usr/src/app"]
WORKDIR /usr/src/app

CMD ["bash"]
