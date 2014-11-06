FROM debian:wheezy
MAINTAINER Johannes Schickling "schickling.j@gmail.com"

ENV triple x86_64-unknown-linux-gnu

# install curl (needed to install rust)
RUN apt-get update && apt-get install -y curl gdb g++-multilib lib32stdc++6

# install rust
RUN curl -sL https://static.rust-lang.org/dist/rust-nightly-$triple.tar.gz | tar xvz -C /tmp
RUN /tmp/rust-nightly-$triple/install.sh

# install cargo
RUN curl -sL https://static.rust-lang.org/cargo-dist/cargo-nightly-$triple.tar.gz | tar xvz -C /tmp
RUN /tmp/cargo-nightly-$triple/install.sh

# cleanup package manager
RUN apt-get remove --purge -y curl && apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
RUN mkdir /source

VOLUME ["/source"]
WORKDIR /source

CMD ["bash"]
