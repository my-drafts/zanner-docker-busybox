#!/bin/sh

echo "";
echo "init nginx";
## +2 mb

if [ "$(opkg list-installed | awk '{ print $1}' | grep -E 'nginx')" != 'nginx' ]; then
	## add user for nginx
	adduser -D -H -s /bin/false nginx nginx;

	## install nginx is not installed
	opkg update;
	opkg install nginx 2>/dev/null;

	## create dir's for nginx
	mkdir -p -m 644 /etc/nginx/ /var/log/nginx/ /var/lib/nginx/;

	## nginx config
	rm -f /etc/nginx/~nginx.conf;
	mv -f /etc/nginx/nginx.conf /etc/nginx/~nginx.conf;
	mv -f /docker/tmp/nginx/nginx.conf /etc/nginx/nginx.conf;

	## nginx-watcher
	mv -f /docker/tmp/nginx/nginx-watcher.sh /bin/
	chmod 755 /bin/nginx-watcher.sh

	## create nginx vhosts
	mkdir -p -m 644 /data/nginx/
	mv -R -f /docker/tmp/nginx/default /data/nginx/

	rmdir /docker/tmp/nginx
fi

## start nginx web server
if [ -f /bin/nginx-watcher.sh ]; then
	/bin/nginx-watcher.sh &
fi
