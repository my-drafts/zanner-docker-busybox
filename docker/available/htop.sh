#!/bin/sh

echo "init htop";
echo "";
# +100 kb

if [ "$(opkg list-installed | awk '{ print $1}' | grep -E 'htop')" != 'htop' ];
then
	# install htop is not installed
	#opkg update
	opkg install htop
fi
