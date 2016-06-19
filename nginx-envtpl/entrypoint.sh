#!/bin/bash

if [[ ! -z $NGINX_CONFIG_TEMPLATE ]]; then
  echo $NGINX_CONFIG_TEMPLATE | envtpl > /etc/nginx/nginx.conf
else
  envtpl /etc/nginx/nginx.conf.tpl
fi

exec "$@"
