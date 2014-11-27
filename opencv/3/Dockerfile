FROM debian:wheezy
MAINTAINER Johannes Schickling "schickling.j@gmail.com"

ENV opencv_version "3.0.0-beta"

ADD install.sh install.sh
RUN chmod +x install.sh && ./install.sh && rm install.sh

VOLUME ["/source"]
WORKDIR /source
CMD ["bash"]
