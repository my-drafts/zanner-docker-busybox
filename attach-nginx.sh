#!/bin/sh

docker  ps  -as
echo ""
docker  attach  bb-nginx
