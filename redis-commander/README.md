# redis-commander

Redis management tool

## Usage

```sh
$ docker run -d --link redis:redis -p 8081:8081 schickling/redis-commander
```

`redis-commander` automatically works when the Redis docker container is linked as `redis` since it uses the `$REDIS_PORT_6379_TCP_ADDR` environment variable.
