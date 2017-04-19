#!/bin/sh

docker rm -f "$(docker ps -aq --filter='ancestor=zanner/busybox')" 2>&1 1>/dev/null
