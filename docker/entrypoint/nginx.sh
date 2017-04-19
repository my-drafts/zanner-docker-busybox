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
	mkdir -p -m 755 /etc/nginx/ /var/log/nginx/ /var/lib/nginx/;

	## nginx config
	rm -f /etc/nginx/~nginx.conf;
	mv -f /etc/nginx/nginx.conf /etc/nginx/~nginx.conf;
	mv -f /docker/tmp/nginx/nginx.conf /etc/nginx/nginx.conf;
	chmod 644 /etc/nginx/nginx.conf

	## nginx-watcher
	mv -f /docker/tmp/nginx/nginx-watcher.sh /bin/
	chmod 744 /bin/nginx-watcher.sh

	## create nginx vhosts
	rmdir /data/nginx 2>/dev/null
	mv -f /docker/tmp/nginx /data
	find /data/nginx -print | xargs chown docker:docker
	find /data/nginx -type d -print | xargs chmod 755
	find /data/nginx -type f -print | xargs chmod 644
	find /data/nginx -type f -print | grep ".conf" | xargs chmod 644
	find /data/nginx -type f -print | grep ".log" | xargs chmod 666
	rmdir /docker/tmp/nginx 2>/dev/null
fi

## start nginx web server
if [ -f /bin/nginx-watcher.sh ]; then
	/bin/nginx-watcher.sh &
fi
