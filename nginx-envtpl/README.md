# nginx-envtpl

Nginx image with support for enviornment variables using [envtpl](https://github.com/andreasjansson/envtpl)

## Usage

```sh
$ docker run -d -p 80:80 -v ./nginx.conf.tpl:/etc/nginx/nginx.conf.tpl schickling/nginx-envtpl
```
