#!/bin/bash
set -e
BASE_PACKAGES="curl gnupg bzip2 ca-certificates apt-transport-https xz-utils"

echo "===> install base packages: $BASE_PACKAGES"
apt-get install --no-install-recommends -qy $BASE_PACKAGES
