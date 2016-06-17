FROM nginx:1.9
MAINTAINER Johannes Schickling "schickling.j@gmail.com"

RUN apt-get update && apt-get install -y python-pip
RUN pip install envtpl

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
