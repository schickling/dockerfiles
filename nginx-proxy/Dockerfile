FROM gcc as builder
RUN apt update && apt install make libpcre3-dev zlib1g-dev unzip git
WORKDIR /build
RUN wget -qO - http://nginx.org/download/nginx-1.17.5.tar.gz | tar zxfv -
RUN git clone https://github.com/openresty/headers-more-nginx-module
RUN cd nginx-1.17.5 && ./configure --prefix=/opt/nginx --with-compat --add-dynamic-module=/build/headers-more-nginx-module && make modules
RUN ls /build/nginx-1.17.5/objs/

FROM jwilder/nginx-proxy:alpine
COPY --from=builder /build/nginx-1.17.5/objs/ngx_http_headers_more_filter_module.so /usr/lib/nginx/modules/
RUN sed -i "/user  nginx;/aload_module modules/ngx_http_headers_more_filter_module.so;" /etc/nginx/nginx.conf
