#!/bin/sh

#echo "docker container's zanner/busybox:"
#docker  ps --all=true --filter "ancestor=zanner/busybox"
#echo "---\n"
#docker  rm -f $(docker  ps -a -f "ancestor=zanner/busybox" -q) 2>/dev/null
#echo "---\n"

docker  run  \
  --detach  \
  --env ENTRYPOINT_ENABLE="dropbear git htop node vim"  \
  --interactive=true  \
  --name=bb-node  \
  --publish=22003:22  \
  --publish=8003:80  \
  --publish-all=true  \
  --restart=always  \
  --tty=true  \
  --volume=/docker/busybox/data/:/data  \
  zanner/busybox:latest

#  --env ENTRYPOINT_ENABLE="alias dropbear git htop nginx node ntpclient vim"  \

echo "---\n"
docker  ps --all=true --filter "ancestor=zanner/busybox"
