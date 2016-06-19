#!/bin/bash

if [[ ! -z $NGINX_CONFIG_TEMPLATE ]]; then
  envtpl < $NGINX_CONFIG_TEMPLATE > /etc/nginx/nginx.conf
else
  envtpl /etc/nginx/nginx.conf.tpl
fi

exec "$@"
