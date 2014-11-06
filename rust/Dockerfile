FROM debian:wheezy
MAINTAINER Johannes Schickling "schickling.j@gmail.com"

ADD install.sh install.sh
RUN ./install.sh && rm install.sh

VOLUME ["/source"]
WORKDIR /source
CMD ["bash"]
