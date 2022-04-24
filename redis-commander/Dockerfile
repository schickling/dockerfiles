FROM debian:bullseye
LABEL maintainer="Johannes Schickling <schickling.j@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ADD install.sh install.sh
RUN bash install.sh && rm install.sh

EXPOSE 8081
CMD bash -c 'redis-commander --redis-host $REDIS_PORT_6379_TCP_ADDR'
