#!/bin/sh

echo "init ntpclient";
echo "";
# +100 kb

if [ "$(opkg list-installed | awk '{ print $1}' | grep -E 'ntpclient')" != 'ntpclient' ];
then
	# install ntpclient is not installed
	#opkg update
	opkg install ntpclient
fi
