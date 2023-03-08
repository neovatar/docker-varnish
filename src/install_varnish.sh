#!/usr/bin/env bash
set -euox pipefail

UBUNTU_CODENAME=$(. /etc/lsb-release; echo ${DISTRIB_CODENAME})
VARNISH_S6_SERVICE=/etc/s6-overlay/s6-rc.d/varnish

echo "===> install varnish version: $VARNISH_VERSION"
curl -L https://packagecloud.io/varnishcache/varnish72/gpgkey | apt-key add -
echo "deb https://packagecloud.io/varnishcache/varnish72/ubuntu/ ${UBUNTU_CODENAME} main" \
  > /etc/apt/sources.list.d/varnish-cache.list
apt-get update
apt-get -y install varnish="${VARNISH_VERSION}~${UBUNTU_CODENAME}"
mkdir -p "${VARNISH_S6_SERVICE}"
cp varnish/* "${VARNISH_S6_SERVICE}"
touch /etc/s6-overlay/s6-rc.d/user/contents.d/varnish
