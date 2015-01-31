FROM php:5.6
MAINTAINER Johannes Schickling "schickling.j@gmail.com"

ADD install.sh install.sh
RUN chmod +x install.sh && ./install.sh && rm install.sh

EXPOSE 2080
CMD ["php", "-S", "0.0.0.0:2080", "-t", "/source"]
