#!/bin/sh

echo "";
echo "init node";
## +?

if [ "$(opkg list-installed | awk '{ print $1}' | grep -E 'node')" != 'node' ];
then
	## install node is not installed
	opkg update
	opkg install node

	npm install -g supervisor
	npm install -g http

	## create dir for node apps
	mkdir -p -m a+r,u+w /data/node/
fi

## start node from directory
if [[ -d /data/node/ && -f /data/node/package.json ]]; then
	cd /data/node/
	npm run start
fi


