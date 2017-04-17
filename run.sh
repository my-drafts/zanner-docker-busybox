#!/bin/sh

./delete-containers.sh

read -p "Container name: " container_name
docker  run  \
  --detach  \
  --env ENTRYPOINT_INIT="alias htop vim"  \
  --hostname=localhost  \
  --interactive=true  \
  --name=${container_name}  \
  --restart=always  \
  --tty=true  \
  --volume=/docker/${container_name}/data/:/data  \
  zanner/busybox:latest

#  --attach="STDOUT"  \
#  --detach  \
#  --env ENTRYPOINT_INIT="alias dropbear git htop nginx node ntpclient vim"  \
#  --publish=22:22  \
#  --publish=80:80  \

echo ""
echo ""
docker  ps --all=true --filter "ancestor=zanner/busybox"

#docker attach ${container_name}
