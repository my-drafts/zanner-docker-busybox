#!/bin/sh

docker rm -f busybox 2>/dev/null 
echo ""
docker rmi -f zanner/busybox 2>/dev/null
echo ""
echo ""
docker images
echo ""
docker ps -a

