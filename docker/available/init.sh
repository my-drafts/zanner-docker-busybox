#!/bin/sh

init_file=(readlink -f $0);
if [[ "$(whoami)" -eq "root" && -f ${init_file} ]]; then
	# init
	passwd && rm ${init_file}
fi
