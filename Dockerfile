FROM ubuntu:16.04

MAINTAINER neovatar

ENV LANG=en_US.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update -q \
 && apt-get upgrade -qy \
 && apt-get install --no-install-recommends -qy bzip2 curl ca-certificates apt-transport-https locales \
 && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen  \
 && echo 'LANG="en_US.UTF-8"'>/etc/default/locale \
 && dpkg-reconfigure --frontend=noninteractive locales \
 && update-locale LANG=en_US.UTF-8 \
 && curl -sSL -o /tmp/s6.tgz https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz \
 && sha256sum /tmp/s6.tgz \
 && echo "b5d360383dd519a33bd39651c43c49b4cf0e95344a94ba65dd8628eefd9ee5cb /tmp/s6.tgz" | sha256sum -c - \
 && tar xvzf /tmp/s6.tgz -C / \
 && rm /tmp/s6.tgz \
 && curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add - \
 && echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.1" >> /etc/apt/sources.list.d/varnish-cache.list \
 && apt-get update \
 && apt-get -y install varnish \
 && rm /etc/default/varnish \
 && mkdir /etc/services.d/varnish \
 && apt-get remove --purge -qy bzip2 curl ca-certificates apt-transport-https \
 && apt-get clean \
 && rm -rf /var/lib/apt

COPY src/varnish.run /etc/services.d/varnish/run 
COPY src/varnish.finish /etc/services.d/varnish/finish

VOLUME ["/etc/varnish"]

ENTRYPOINT ["/init"]
