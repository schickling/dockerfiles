FROM debian:wheezy
LABEL maintainer="Johannes Schickling <schickling.j@gmail.com>"

# needed by cargo
ENV USER root

ADD install.sh install.sh
RUN sh install.sh && rm install.sh

VOLUME ["/source"]
WORKDIR /source
CMD ["bash"]
