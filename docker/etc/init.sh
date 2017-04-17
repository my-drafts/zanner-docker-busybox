#!/bin/sh

init=" ${ENTRYPOINT_INIT} ";
for path in /docker/init/*.sh; do
	file=`basename ${path} .sh`;
	if [ "${init}" != "${init/ $file / }" ]; then
		sh ${path};
	fi
done

if [ -f /docker/tmp/init.sh ]; then
	rm /docker/tmp/init.sh;
fi

