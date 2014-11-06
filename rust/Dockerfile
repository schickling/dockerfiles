FROM debian:wheezy
MAINTAINER Johannes Schickling "schickling.j@gmail.com"

# needed by cargo
ENV USER root

ADD install.sh install.sh
RUN chmod +x install.sh && ./install.sh && rm install.sh

VOLUME ["/source"]
WORKDIR /source
CMD ["bash"]
