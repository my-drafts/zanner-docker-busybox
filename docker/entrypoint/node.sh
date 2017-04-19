#!/bin/sh

echo "";
echo "init node";
## +?

if [ "$(opkg list-installed | awk '{ print $1}' | grep -E 'node')" != 'node' ]; then
	## install node is not installed
	opkg update
	opkg install node

	npm install -g supervisor
	npm install -g http

	## create dir for node apps
	rmdir /data/node 2>/dev/null
	mv -f /docker/tmp/node /data
	find /data/node -print | xargs chown docker:docker
	find /data/node -type d -print | xargs chmod 755
	find /data/node -type f -print | xargs chmod 644
	rmdir /docker/tmp/node 2>/dev/null
fi

## start node from directory
if [[ -d /data/node/ && -f /data/node/package.json ]]; then
	cd /data/node/
	npm run start
fi


