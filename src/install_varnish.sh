#!/bin/bash
set -e
UBUNTU_CODENAME=$(. /etc/lsb-release; echo $DISTRIB_CODENAME)

echo "===> install varnish version: $VARNISH_VERSION"
curl -L https://packagecloud.io/varnishcache/varnish5/gpgkey | apt-key add -
echo "deb https://packagecloud.io/varnishcache/varnish5/ubuntu/ $UBUNTU_CODENAME main" \
  > /etc/apt/sources.list.d/varnish-cache.list
apt-get update
apt-get -y install varnish=$VARNISH_VERSION
rm /etc/default/varnish
mkdir /etc/services.d/varnish
cp varnish/run /etc/services.d/varnish/run 
cp varnish/finish /etc/services.d/varnish/finish
