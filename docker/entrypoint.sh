#!/bin/sh

if [ -f /docker/tmp/init.sh ]; then
	/docker/tmp/init.sh
fi

/bin/sh
