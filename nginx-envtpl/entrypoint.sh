#!/bin/bash

if [[ ! -z $NGINX_CONFIG_TEMPLATE ]]; then
  echo $NGINX_CONFIG_TEMPLATE | envtpl > /etc/nginx/nginx.conf
elif [[ ! -z $NGINX_CONFIG_TEMPLATE_B64 ]]; then
  echo $NGINX_CONFIG_TEMPLATE_B64 | base64 --decode | envtpl > /etc/nginx/nginx.conf
else
  envtpl /etc/nginx/nginx.conf.tpl
fi

exec "$@"
