#!/bin/sh

echo "init nginx";
echo "";
## +2 mb

if [ "$(opkg list-installed | awk '{ print $1}' | grep -E 'nginx')" != 'nginx' ];
then
	## add user for nginx
	adduser -s /bin/false -D nginx nginx

	## install nginx is not installed
	opkg update
	opkg install nginx

	## create dir's for nginx
	mkdir -p -m a+r,u+w /etc/nginx/ /var/log/nginx/ /var/lib/nginx/

	## move default config
	mv -f -n /etc/nginx/nginx.conf /etc/nginx/~nginx.conf

	## copy manual conf to 
	cp -f /docker/etc/nginx/nginx.conf /etc/nginx/nginx.conf

	## create dir for nginx vhosts
	mkdir -p -m a+r,u+w /data/nginx/

	## copy manual conf to 
	cp -R -f /docker/etc/nginx/default /data/nginx/
fi

/docker/etc/nginx/nginx-watcher.sh &
