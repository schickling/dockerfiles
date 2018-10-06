FROM alpine:3.6

# Versions: https://pypi.python.org/pypi/awscli#downloads
ENV AWS_CLI_VERSION 1.15.47
ENV SCHEDULE **None**

RUN apk --no-cache update && \
apk --no-cache add python py-pip py-setuptools ca-certificates groff less && \
pip --no-cache-dir install awscli==${AWS_CLI_VERSION} && \
rm -rf /var/cache/apk/*

# install go-cron
RUN apk add --no-cache curl && \
  curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz | zcat > /usr/local/bin/go-cron && \
  chmod u+x /usr/local/bin/go-cron && apk del curl

ADD run.sh /opt/s3cmd/run.sh
RUN chmod a+x /opt/s3cmd/run.sh

ENTRYPOINT ["/opt/s3cmd/run.sh"]


WORKDIR /data
