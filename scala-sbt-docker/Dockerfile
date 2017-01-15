# Based on debian-jessie
FROM openjdk:8

###
# START COPY FROM https://github.com/hseeberger/scala-sbt/blob/master/Dockerfile
###

ENV SCALA_VERSION 2.12.1
ENV SBT_VERSION 0.13.13

# Install Scala
## Piping curl directly in tar
RUN \
  curl -fsL http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C /root/ && \
  echo >> /root/.bashrc && \
  echo 'export PATH=~/scala-$SCALA_VERSION/bin:$PATH' >> /root/.bashrc

# Install sbt
RUN \
  curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

# Define working directory
WORKDIR /root

###
# END COPY
###

# Install docker
#RUN \
#  apt-get install -y apt-transport-https ca-certificates gnupg2 && \
#  apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
#  echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list && \
#  apt-get update && \
#  apt-get install -y docker-engine && \
#  docker -v

## Install docker-compose
#RUN \
#  curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
#  chmod +x /usr/local/bin/docker-compose && \
#  docker-compose -v

# Install mysql
#ENV DEBIAN_FRONTEND noninteractive
#RUN \
#  echo "mysql-community-server mysql-community-server/data-dir select ''" | debconf-set-selections && \
#  echo "mysql-community-server mysql-community-server/root-pass password password" | debconf-set-selections && \
#  echo "mysql-community-server mysql-community-server/re-root-pass password password" | debconf-set-selections && \
#  echo "deb http://repo.mysql.com/apt/debian/ jessie mysql-5.7" > /etc/apt/sources.list.d/mysql.list && \
#  apt-get install -y apt-transport-https && \
#  apt-key adv --keyserver pgp.mit.edu --recv-keys 5072E1F5 && \
#  apt-get update && \
#  apt-get install -y mysql-community-client mysql-community-server && \
#  mysql --version
#
## Install redis
#RUN \
#  apt-get install -y redis-server && \
#  redis-server -v
