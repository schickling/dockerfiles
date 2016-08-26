#!/bin/bash

if [[ ! -z $NGINX_CONFIG_TEMPLATE ]]; then
  echo $NGINX_CONFIG_TEMPLATE | envtpl > /etc/nginx/nginx.conf
elif [[ ! -z $NGINX_CONFIG_TEMPLATE_B64 ]]; then
  echo $NGINX_CONFIG_TEMPLATE_B64 | base64 --decode | envtpl > /etc/nginx/nginx.conf
else
  envtpl /etc/nginx/nginx.conf.tpl
fi

if [[ ! -z $NGINX_AUTH_BASIC_USER && ! -z $NGINX_AUTH_BASIC_PASSWORD ]]; then
  echo -n "$NGINX_AUTH_BASIC_USER:" > /etc/nginx/.htpasswd
  openssl passwd -apr1 $NGINX_AUTH_BASIC_PASSWORD >> /etc/nginx/.htpasswd
fi

exec "$@"
