#!/bin/sh
set -x
VOLUME=$(pwd)/data
REPOSITORY=$(cat REPOSITORY)
BUILDTAG=$(cat BUILDTAG)
[ -d "$VOLUME" ] || mkdir "$VOLUME"

/usr/bin/docker run \
  -ti \
  --rm \
  --name varnish \
  --net=host \
  "$REPOSITORY:$BUILDTAG"

  # -v "$VOLUME/vcl":/etc/varnish \
  # -v "$VOLUME/conf/varnish":/etc/default \
