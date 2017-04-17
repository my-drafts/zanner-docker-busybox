#!/bin/sh

./delete-containers.sh

read -p "Container name: " container_name
docker  run  \
  --attach="STDOUT"  \
  --env ENTRYPOINT_INIT="alias htop vim"  \
  --hostname=localhost  \
  --interactive=true  \
  --name=${container_name}  \
  --publish=22001:22  \
  --publish=8001:80  \
  --restart=always  \
  --tty=true  \
  --volume=/docker/busybox/data/:/data  \
  --volume=/docker/busybox/docker/entrypoint.sh:/docker/entrypoint.sh:ro  \
  --volume=/docker/busybox/docker/etc:/docker/etc:ro  \
  --volume=/docker/busybox/docker/init:/docker/init:ro  \
  zanner/busybox:latest

#  --attach="STDOUT"  \
#  --detach  \
#  --env ENTRYPOINT_INIT="alias dropbear git htop nginx node ntpclient vim"  \
#  --publish=22:22  \

echo ""
echo ""
docker  ps --all=true --filter "ancestor=zanner/busybox"

#docker attach bb


