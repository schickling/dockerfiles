# beanstalkd-console

Admin console for Beanstalk queue server

## Usage

```sh
$ docker run -d -p 11300:11300 --name beanstalkd schickling/beanstalkd
$ docker run -d -p 2080:2080 --link beanstalkd:beanstalkd schickling/beanstalkd-console
```

`beanstalkd-console` automatically works when the Beanstalkd docker container is linked as `beanstalkd` since it populates the `BEANSTALK_SERVERS` environment variable with `$BEANSTALKD_PORT_11300_TCP_ADDR:11300`.
