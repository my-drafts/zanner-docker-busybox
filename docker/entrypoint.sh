#!/bin/sh

## create link from available to enbale
if [ -f /docker/available/init.sh]; then
	ln -fs /docker/available/init.sh /docker/enable/init.sh
fi

for path in $(ls /docker/available/*.sh); do
	file="${path##*/}";
	name="${file%%.sh}";
	like=$(echo ${ENTRYPOINT_ENABLE} | grep -E "(^|\s|\:)${name}($|\s|\:)");
	if [ -n "${like}" ]; then
		ln -fs /docker/available/${name}.sh /docker/enable/${name}.sh
	fi
done

## run enable
if [ -f /docker/enable/init.sh]; then
	sh /docker/enable/init.sh;
fi

for path in $(ls /docker/enable/*.sh); do
	sh ${path};
done

/bin/sh
