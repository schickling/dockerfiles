# rust

Lightweight nightly Rust build including Cargo and GDB

## Usage

```sh
$ docker run --rm -it -v $(pwd):/source schickling/rust
```

Mount your local source folder to the container and compile & run code inside.

#### Compiling code

```sh
$ rustc hello-world.rs
$ ./hello-world
> Hello World!
```

#### Environment variables

The `$USER` environment variable can be specified, which is used by `cargo`. The default is `root`.

```sh
$ docker run --rm -it -e USER="John Doe" -v $(pwd):/source schickling/rust
```

#### Running cargo as local user

In order to run cargo as a local user and not as root run this:

```sh
$ docker run --rm -it \
  -u $UID \
  -e USER=$USER \
  -e CARGO_HOME=/source/.cargo \
  -v $HOME/.cargo:/source/.cargo \
  -v $(pwd):/source \
  schickling/rust \
  cargo build
```

Note the new volume for the cargo cache and the `-u` flag.
