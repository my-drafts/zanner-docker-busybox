#!/bin/sh

echo "";
echo "init dropbear";
## +100 kb

if [ "$(opkg list-installed | awk '{ print $1}' | grep -E 'dropbear')" != 'dropbear' ];
then
	## install dropbear is not installed
	opkg update
	opkg install dropbear

	## add dropbear user
	adduser -D -H -s /bin/false dropbear dropbear

	## replace config
	cp -f /docker/etc/dropbear/dropbear /etc/config/dropbear

	## remove invalid keys: dropbear_rsa_host_key, etc
	rm /etc/dropbear/*_key

	## ssh wellcome message
	echo "Wellcome to ${hostname}!" > /etc/banner
fi

## run ssh server
su - dropbear -c 'dropbear -R -w -p 22'
