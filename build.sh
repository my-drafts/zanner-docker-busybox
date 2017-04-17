#!/bin/sh

./delete-containers.sh
./delete-image.sh

docker  build  --tag="zanner/busybox" .
echo ""
docker  images
echo ""
