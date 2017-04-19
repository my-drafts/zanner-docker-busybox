#!/bin/sh

init=" ${ENTRYPOINT} ";

for path in /docker/entrypoint/*.sh; do
	file=`basename ${path} .sh`;
	if [ "${init}" != "${init/ $file / }" ]; then
		/bin/sh ${path};
	fi
done

/bin/sh
