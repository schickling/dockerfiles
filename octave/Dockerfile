FROM debian:wheezy
MAINTAINER Johannes Schickling "schickling.j@gmail.com"

# install octave 3.6.2
RUN apt-get update && apt-get install -y octave

# cleanup package manager
RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
RUN mkdir -p /usr/src/app

VOLUME ["/usr/src/app"]
WORKDIR /usr/src/app

CMD ["octave"]
