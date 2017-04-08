#!/bin/sh

echo "docker container's zanner/busybox:"
docker  ps --all=true --filter "ancestor=zanner/busybox"
echo "---"
echo ""
echo "deleting container's id:"
docker  rm -f $(docker  ps -a -f "ancestor=zanner/busybox" -q) 2>/dev/null
echo "---"
echo ""

echo "docker image's:"
docker  images
echo "---"
echo ""
echo "deleting image's:"
docker  rmi -f zanner/busybox 2>/dev/null
echo "---"
echo ""

echo "building image zanner/busybox:"
docker  build --tag="zanner/busybox" .
echo "---"
echo ""

echo "docker images:"
docker  images
echo "---"
echo ""

echo "docker images:"
docker  images
echo "---"
echo ""
