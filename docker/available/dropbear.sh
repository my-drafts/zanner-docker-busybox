#!/bin/sh

echo "init dropbear";
echo "";
## +100 kb

if [ "$(opkg list-installed | awk '{ print $1}' | grep -E 'dropbear')" != 'dropbear' ];
then
	## install dropbear is not installed
	opkg update
	opkg install dropbear

	## remove invalid keys: dropbear_rsa_host_key, etc
	rm /etc/dropbear/*_key

	## ssh wellcome message
	echo "Wellcome to ${hostname}!" > /etc/banner
fi

## run ssh server
dropbear -R -w -p 22
