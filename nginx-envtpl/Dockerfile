FROM debian:sid

LABEL maintainer="Johannes Schickling <schickling.j@gmail.com>"

RUN apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
            openssl \
						ca-certificates \
						nginx-extras \
            python-pip \
            python-setuptools \
	&& rm -rf /var/lib/apt/lists/*

RUN pip2 install envtpl

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
