#!/bin/sh

echo "docker images:"
docker images
echo "---\n"
docker  build  \
  --tag="zanner/busybox":latest  \
  .
echo "---\ndocker images:"
docker images
echo "---\n"
