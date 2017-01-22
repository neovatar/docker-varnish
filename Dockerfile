FROM ubuntu:16.04

MAINTAINER neovatar

ENV LANG=en_US.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

COPY src/* /tmp/

RUN /tmp/docker-install.sh \
 && rm -rf /tmp/*

ENTRYPOINT ["/init"]
