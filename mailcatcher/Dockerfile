FROM debian:wheezy
MAINTAINER Johannes Schickling "schickling.j@gmail.com"

# install ruby 1.9.1
RUN apt-get update && apt-get install -y ruby ruby-dev build-essential sqlite3 libsqlite3-dev

# install mailcatcher
RUN gem install mailcatcher --no-ri --no-rdoc

# cleanup package manager
RUN apt-get remove --purge -y build-essential ruby-dev libsqlite3-dev && apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# smtp port
EXPOSE 1025

# webserver port
EXPOSE 1080

CMD ["mailcatcher", "-f", "--ip=0.0.0.0"]
