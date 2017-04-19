#!/bin/sh

nginx_conf="/etc/nginx/nginx.conf"
nginx_config_changed=8
nginx_watcher_sleep=4

nginx_config_last () {
	last=0;
	include=$(cat ${nginx_conf} | grep ".conf" | sed 's/^.*include\s*\(.*\.conf\);.*$/\1/');
	for path in $(ls ${include}); do
		modified=$(date -r ${path} +'%s');
		if [ ${modified} -gt ${last} ]; then
			last=${modified};
		fi
	done
	echo ${last};
}

nginx_test () {
	nginx -tq 2>&1 1>/dev/null && echo "OK" || echo ""
}

nginx_started=0
while [ true ]; do
	if [ -n $(nginx_test) ]; then
		#chmod -h -R -L 755 /data/nginx/*
		#chmod -h -R -L 644 /data/nginx/*.conf
		#chmod -h -R -L 666 /data/nginx/*.log
		nginx_pids=$(ps | grep -E 'nginx[\:]' | awk '{ print $1 }');
		nginx_last=$(nginx_config_last);
		diff=$(( ${nginx_last} - ${nginx_started} ));
		if [ -z "${nginx_pids}" ]; then
			nginx &
			nginx_started=$(date +'%s');
		elif [[ ${diff} -lt 0 || ${diff} -gt ${nginx_config_changed} ]]; then
			nginx -s reload
			nginx_started=${nginx_last};
		fi
	fi
	sleep ${nginx_watcher_sleep}
done
echo "";
