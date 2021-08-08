#!/bin/bash
set -e

S6OVERLAY_VERSION="2.2.0.3"
S6OVERLAY_SHA256="a7076cf205b331e9f8479bbb09d9df77dbb5cd8f7d12e9b74920902e0c16dd98"
S6OVERLAY_ARCHIVE=/tmp/s6-overlay-amd64.tar.gz
S6OVERLAY_URL=https://github.com/just-containers/s6-overlay/releases/download/v${S6OVERLAY_VERSION}/$(basename ${S6OVERLAY_ARCHIVE})

echo "===> install s6 overlay v${S6OVERLAY_VERSION}"
curl -sSL -o ${S6OVERLAY_ARCHIVE} ${S6OVERLAY_URL}
echo "$S6OVERLAY_SHA256 $S6OVERLAY_ARCHIVE" | sha256sum -c -
tar -h -xvzf "${S6OVERLAY_ARCHIVE}" -C /
rm "${S6OVERLAY_ARCHIVE}"
