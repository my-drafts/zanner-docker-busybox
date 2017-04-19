#!/bin/sh

echo "";
echo "init git";
## +?

if [ "$(opkg list-installed | awk '{ print $1}' | grep -E 'git')" != 'git' ]; then
	## install git is not installed
	opkg update
	opkg install git
fi
