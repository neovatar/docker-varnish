FROM ubuntu:16.04

ARG VARNISH_VERSION=5.1.2-1

LABEL maintainer "tom@neovatar.org"
LABEL varnish_version=$VARNISH_VERSION

ENV DEBIAN_FRONTEND=noninteractive \
    VARNISH_VERSION=$VARNISH_VERSION \
    LANG=en_US.UTF-8 \
    TZ=Europe/Berlin

COPY src/ /tmp/docker/
WORKDIR "/tmp/docker"

RUN apt-get update -q \
 && apt-get upgrade -qy \
 && ./install_basepackages.sh \
 && ./install_locale.sh \
 && ./install_timezone.sh \
 && ./install_s6.sh \
 && ./install_varnish.sh \
 && rm -rf /tmp/* \
 && rm -rf /var/lib/apt

ENTRYPOINT ["/init"]
