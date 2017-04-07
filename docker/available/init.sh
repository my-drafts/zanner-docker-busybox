#!/bin/sh

init_file="/docker/enable/init.sh"
if [[ "$(whoami)" -eq "root" && -f ${init_file} ]]; then
	# init
	passwd && rm ${init_file}
fi
