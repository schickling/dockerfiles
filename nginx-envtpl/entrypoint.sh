#!/bin/sh

envtpl /etc/nginx/nginx.conf.tpl

exec "$@"
