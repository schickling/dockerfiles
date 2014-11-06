FROM debian:wheezy
MAINTAINER Johannes Schickling "schickling.j@gmail.com"

# install curl (needed to install rust)
RUN apt-get update && apt-get install -y curl g++-multilib lib32stdc++6

# install rust & cargo
RUN curl -L https://static.rust-lang.org/dist/rust-nightly-x86_64-unknown-linux-gnu.tar.gz | tar xvz -C /opt/rust
RUN bash -c "ln -s /opt/rust/bin/{rustc,rustdoc} /usr/local/bin/"
RUN ls /opt/rust/bin

# cleanup package manager
RUN apt-get remove --purge -y curl && apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# prepare dir
RUN mkdir /source

VOLUME ["/source"]
WORKDIR /source

CMD ["bash"]
