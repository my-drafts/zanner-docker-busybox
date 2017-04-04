#!/bin/sh

docker images -a
echo ""
docker  build  \
  --tag="zanner/busybox":latest  \
  .
echo ""
echo ""
docker images -a
