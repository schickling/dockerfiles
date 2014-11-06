FROM debian:wheezy
MAINTAINER Johannes Schickling "schickling.j@gmail.com"

# install octave 3.6.2
RUN apt-get update && apt-get install -y octave

# cleanup package manager
RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
RUN mkdir /source

VOLUME ["/source"]
WORKDIR /source

CMD ["octave"]
