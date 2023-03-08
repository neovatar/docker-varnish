#!/bin/bash
set -e

S6OVERLAY_VERSION="3.1.4.1"
S6OVERLAY_NOARCH_ARCHIVE=/tmp/s6-overlay-noarch.tar.xz
S6OVERLAY_NOARCH_SHA256="d55e3d1c37f6eee9817539c09bce5093531e0ede1b97e02e96934785671595f1"
S6OVERLAY_ARCHIVE=/tmp/s6-overlay-x86_64.tar.xz
S6OVERLAY_SHA256="4ba82916d114aafd92516a86258c5175c642be04e7329b316b11efac8cf4d4d4"
S6OVERLAY_BASEURL="https://github.com/just-containers/s6-overlay/releases/download/v${S6OVERLAY_VERSION}"

# /$(basename ${S6OVERLAY_ARCHIVE})

echo "===> install s6 overlay v${S6OVERLAY_VERSION}"
curl -sSL -o ${S6OVERLAY_NOARCH_ARCHIVE} "${S6OVERLAY_BASEURL}/$(basename ${S6OVERLAY_NOARCH_ARCHIVE})"
echo "$S6OVERLAY_NOARCH_SHA256 $S6OVERLAY_NOARCH_ARCHIVE" | sha256sum -c -

curl -sSL -o ${S6OVERLAY_ARCHIVE} "${S6OVERLAY_BASEURL}/$(basename ${S6OVERLAY_ARCHIVE})"
echo "$S6OVERLAY_SHA256 $S6OVERLAY_ARCHIVE" | sha256sum -c -

# We need to extract in two steps, because in Ubuntu 20.04 /bin is a symlink to /usr/bin
tar -C / -Jxpf "${S6OVERLAY_NOARCH_ARCHIVE}"
tar -C / -Jxpf "${S6OVERLAY_ARCHIVE}"

rm "${S6OVERLAY_NOARCH_ARCHIVE}" "${S6OVERLAY_ARCHIVE}"
