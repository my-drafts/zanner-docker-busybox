#!/bin/sh

echo "docker container's zanner/busybox:"
docker  ps --all=true --filter "ancestor=zanner/busybox"
echo "---"
echo ""
echo "deleting container's id:"
docker  rm -f $(docker  ps -a -f "ancestor=zanner/busybox" -q) 2>/dev/null
echo "---"
echo ""

read -p "Container name: " container_name
docker  run  \
  --attach="STDOUT"  \
  --env ENTRYPOINT_ENABLE="dropbear htop vim"  \
  --hostname=localhost  \
  --interactive=true  \
  --name=${container_name}  \
  --publish-all=true  \
  --restart=always  \
  --tty=true  \
  --volume=/docker/busybox/data/:/data  \
  zanner/busybox:latest

#  --detach  \
#  --env ENTRYPOINT_ENABLE="alias dropbear git htop nginx node ntpclient vim"  \
#  --publish=22:22  \

echo "---"
echo ""
docker  ps --all=true --filter "ancestor=zanner/busybox"

#docker attach bb


