#!/bin/bash
set -e

DEST_DIR=/var/docker/build/varnish
SSH_DEST=""
case $1 in
prod)
  SSH_DEST="tom@spike"
  ;;
*)
  SSH_DEST="tom@10.33.66.11"
  ;;
esac

echo "=> rsync"
echo "   src: $(pwd)"
echo "   dst: $SSH_DEST:$DEST_DIR"
rsync -rlptgo \
  --delete \
  --delete-excluded \
  --exclude='/.git' \
  --filter="dir-merge,- .gitignore" \
 . $SSH_DEST:$DEST_DIR

ssh -A $SSH_DEST "cd $DEST_DIR && sudo ./install.sh"
