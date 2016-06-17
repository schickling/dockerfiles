# nginx-envtpl

Nginx image with support for environment variables using [envtpl](https://github.com/andreasjansson/envtpl)

## Usage

```sh
$ docker run -d -p 80:80 -e NGINX_WORKER_RLIMIT_NOFILE=... -v ./nginx.conf.tpl:/etc/nginx/nginx.conf.tpl schickling/nginx-envtpl
```

### Example `nginx.conf.tpl`

```nginx
worker_processes auto;
worker_rlimit_nofile {{ NGINX_WORKER_RLIMIT_NOFILE }};
error_log /dev/stdout info;

events {
    worker_connections {{ NGINX_WORKER_CONNECTIONS }};
    use epoll;
    multi_accept on;
}

http {

    proxy_cache_path /tmp/nginx levels=1:2 keys_zone=my_zone:10m inactive=60m;

    access_log /dev/stdout;

    server {

        listen 80 backlog={{ NGINX_BACKLOG }};
        root /usr/share/nginx/html/;
        index index.html;

        server_name localhost;

        charset utf-8;

        location / {
            proxy_pass {{ NGINX_PROXY_ADDR }};
            proxy_cache my_zone;
            proxy_cache_methods POST;
            proxy_cache_key "$request_uri|$request_body";
            proxy_cache_valid 5s;
            proxy_cache_use_stale error timeout updating;

            add_header X-Proxy-Cache $upstream_cache_status;
        }
    }

}
```