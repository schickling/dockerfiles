# beanstalkd-console

Admin console for Beanstalk queue server

## Usage

```sh
$ docker run -d -p 11300:11300 --name beanstalkd schickling/beanstalkd
$ docker run -d -p 2080:2080 --link beanstalkd:beanstalkd schickling/beanstalkd-console
```

`beanstalkd-console` automatically works when the Beanstalkd docker container is linked as `beanstalkd` since it populates the `BEANSTALK_SERVERS` environment variable with `$BEANSTALKD_PORT_11300_TCP_ADDR:11300`.

## Authentication (Basic Auth)
For using basic auth in console should add these environment variables:  
`AUTH=enable`  
`AUTH_USERNAME=username` (default is `admin`)  
`AUTH_PASSWORD=password` (default is `password`)  
To run console with auth use this command:  
```sh
docker run -d -p 2080:2080 --link beanstalkd:beanstalkd -e AUTH=enable -e AUTH_USERNAME=admin -e AUTH_PASSWORD=password schickling/beanstalkd-console
```





