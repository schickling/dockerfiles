FROM mhart/alpine-node
MAINTAINER Johannes Schickling "schickling.j@gmail.com"

ENV VERSION "v2.2.2"
ENV FOLDER "swagger-ui-2.2.2"
ENV API_URL "http://petstore.swagger.io/v2/swagger.json"
ENV API_KEY "**None**"
ENV SWAGGER_JSON "/app/swagger.json"
ENV PORT 80

WORKDIR /app

RUN apk update && apk add openssl
RUN wget -qO- https://github.com/swagger-api/swagger-ui/archive/$VERSION.tar.gz | tar xvz
RUN cp -r $FOLDER/dist/* . && rm -rf $FOLDER
RUN npm install -g http-server
RUN apk del openssl

ADD run.sh run.sh

# webserver port
EXPOSE 80

CMD ["sh", "run.sh"]
