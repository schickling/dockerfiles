FROM ruby:2.7.6-alpine3.15

LABEL maintainer="Johannes Schickling <schickling.j@gmail.com>"

RUN set -xe \
    && apk add --no-cache \
        libstdc++ \
        sqlite-libs \
    && apk add --no-cache --virtual .build-deps \
        build-base \
        sqlite-dev \
    && gem install mailcatcher -v 0.8.2 -N \
    && apk del .build-deps

ENV HTTPPATH="/"

# smtp port
EXPOSE 1025

# webserver port
EXPOSE 1080

CMD ["sh", "-c", "mailcatcher --no-quit --foreground --ip=0.0.0.0 --http-path $HTTPPATH"]
