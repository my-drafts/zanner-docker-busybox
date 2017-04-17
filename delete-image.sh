#!/bin/sh

docker  images
echo ""
docker  rmi  -f  zanner/busybox  2>&1  1>/dev/null
echo ""
