#!/bin/sh

docker  ps  -as
echo ""
docker  run  \
  --detach  \
  --interactive=true  \
  --name=busybox  \
  --publish-all=true  \
  --restart=always  \
  --tty=true  \
  zanner/busybox:latest
echo ""
echo ""
docker  ps  -as
