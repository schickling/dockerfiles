# beanstalkd-console

Admin console for Beanstalk queue server

## Usage

```sh
$ docker run -d -p 11300:11300 --name beanstalkd schickling/beanstalkd
$ docker run -d -p 2080:2080 --link beanstalkd:beanstalkd schickling/beanstalkd-console
```

