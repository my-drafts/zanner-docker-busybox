#!/bin/sh

mkdir -p -m 755 data/

name="node"

docker run  \
  --detach  \
  --env ENTRYPOINT="alias git htop node vim"  \
  --hostname="${name}"  \
  --interactive=true  \
  --name="${name}"  \
  --publish=80:80  \
  --restart=always  \
  --tty=true  \
  --volume="${PWD}/data/:/data/"  \
  zanner/busybox:latest

#  --env ENTRYPOINT_INIT="alias dropbear git htop nginx node ntpclient vim"  \
#  --publish=22:22  \
#  --publish=80:80  \
