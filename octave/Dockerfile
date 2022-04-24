FROM debian:wheezy
LABEL maintainer="Johannes Schickling <schickling.j@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ADD install.sh install.sh
RUN bash install.sh && rm install.sh

VOLUME ["/source"]
WORKDIR /source
CMD ["octave"]
