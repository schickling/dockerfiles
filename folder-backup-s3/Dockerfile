FROM alpine:latest
LABEL maintainer="Zhong Huiwen <zhonghuiwen@gmail.com>"

ADD install.sh install.sh
RUN sh install.sh && rm install.sh

ENV DATA_PATH **None**
ENV S3_ACCESS_KEY_ID **None**
ENV S3_SECRET_ACCESS_KEY **None**
ENV S3_BUCKET **None**
ENV S3_REGION us-west-1
ENV S3_ENDPOINT **None**
ENV S3_S3V4 no
ENV S3_PREFIX 'folder-backup'
ENV SCHEDULE **None**

ADD run.sh run.sh
ADD backup.sh backup.sh

CMD ["sh", "run.sh"]
