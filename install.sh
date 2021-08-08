#!/bin/bash
set -e

echo "==> create directories"
VOLUME_BASEDIR=/var/docker/volumes

mkdir -p "$VOLUME_BASEDIR/varnish/conf"
chown root:root "$VOLUME_BASEDIR/varnish/conf"
mkdir -p "$VOLUME_BASEDIR/varnish/vcl"
chown root:root "$VOLUME_BASEDIR/varnish/vcl"

echo "==> add systemd service"
cp varnish.service /etc/systemd/system/
systemctl daemon-reload
systemctl restart varnish
systemctl enable varnish
