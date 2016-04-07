FROM ruby:2.2 
MAINTAINER Johannes Schickling "schickling.j@gmail.com"

ADD install.sh install.sh
RUN chmod +x install.sh && ./install.sh && rm install.sh

# smtp port
EXPOSE 1025

# webserver port
EXPOSE 1080

CMD ["mailcatcher", "-f", "--ip=0.0.0.0"]
