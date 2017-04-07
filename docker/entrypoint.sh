#!/bin/sh

## create link from available to enbale
for path in $(ls /docker/available/*.sh); do
	file="${path##*/}";
	name="${file%%.sh}";
	like=$(echo ${ENTRYPOINT_ENABLE} | grep -E "(^|\s|\:)${name}($|\s|\:)");
	if [ -n "${like}" ]; then
		ln -fs /docker/available/${name}.sh /docker/enable/${name}.sh
	elif [ "${name}" -eq "init" ]; then
		ln -fs /docker/available/${name}.sh /docker/enable/${name}.sh
	fi
done

## run enable
for path in $(ls /docker/enable/*.sh); do
	sh ${path};
done

/bin/sh
