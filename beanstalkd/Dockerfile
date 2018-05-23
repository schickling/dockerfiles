FROM alpine
LABEL maintainer="Johannes Schickling <schickling.j@gmail.com>"

RUN apk add --no-cache beanstalkd

EXPOSE 11300
ENTRYPOINT ["/usr/bin/beanstalkd"]
