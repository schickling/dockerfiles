# mailcatcher

Extra small mailcatcher image (261.9 MB)

## Usage

```sh
$ docker run -d -p 1080:1080 -p 1025:1025 --name mailcatcher schickling/mailcatcher
```

Link the container to another container and use the mailcatcher SMTP port `1025` via a ENV variable like `$MAILCATCHER_PORT_1025_TCP_ADDR`.

## HTTP Path Support
You can run the web interface under a different root by specifying the environmental variable HTTPPATH. This can be used if you're proxying the incoming connection. 

```sh
$ docker run -d -p 1080:1080 -e HTTPPATH="mailcatcher" --name mailcatcher schickling/mailcatcher
```
