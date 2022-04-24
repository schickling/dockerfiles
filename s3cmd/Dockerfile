FROM alpine:3.15
LABEL maintainer="Johannes Schickling <schickling.j@gmail.com>"

ADD install.sh install.sh
RUN sh install.sh && rm install.sh

ENV SCHEDULE **None**

ADD run.sh /opt/s3cmd/run.sh

WORKDIR /s3

ENTRYPOINT ["/opt/s3cmd/run.sh"]
