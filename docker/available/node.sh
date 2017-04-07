#!/bin/sh

echo "init node";
echo "";
# +?

if [ "$(opkg list-installed | awk '{ print $1}' | grep -E 'node')" != 'node' ];
then
	# install node is not installed
	#opkg update
	opkg install node

	npm install -g supervisor
	npm install -g http

	# create dir for node apps
	mkdir -p -m a+r,u+w /data/node/
fi
