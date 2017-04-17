#!/bin/sh

docker  ps  --all=true  --filter="ancestor=zanner/busybox"  --size
echo ""
docker  rm  -f  $(docker ps --all=true --filter="ancestor=zanner/busybox" --quiet)  2>&1  1>/dev/null
echo ""
docker  ps  --all=true  --filter="ancestor=zanner/busybox"  --size
