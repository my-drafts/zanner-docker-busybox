#!/bin/sh

echo "docker container's zanner/busybox:"
docker  ps --all=true --filter "ancestor=zanner/busybox"
echo "---\n"
docker  rm -f $(docker  ps -a -f "ancestor=zanner/busybox" -q) 2>/dev/null
echo "---\n"

echo "docker images:"
docker  images
echo "---\n"
docker  rmi -f zanner/busybox 2>/dev/null
echo "---\n"

echo "building image zanner/busybox:"
docker  build --tag="zanner/busybox":latest .
echo "---\n"

echo "docker images:"
docker  images
echo "---\n"
