FROM debian:bullseye
LABEL maintainer="Johannes Schickling <schickling.j@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ADD install.sh install.sh
RUN bash install.sh && rm install.sh

EXPOSE 4000
VOLUME ["/source"]
WORKDIR /source
CMD ["jekyll", "serve", "--host=0.0.0.0", "--watch"]
