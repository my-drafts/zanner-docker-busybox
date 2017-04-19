FROM  progrium/busybox:latest
LABEL maintainer "Sergyi Kukharyev <sergej.kucharev@gmail.com>"

RUN  passwd -d root
RUN  opkg-install opkg 2>/dev/null
RUN  opkg update

RUN  mkdir -p /docker/
RUN  chmod 755 /docker/
ADD  entrypoint.sh /docker/entrypoint.sh
ADD  entrypoint /docker/entrypoint
ADD  tmp /docker/tmp
RUN  chmod -R a+x /docker/*.sh

RUN  mkdir -p /data/
RUN  chmod 755 /data/
VOLUME ["/data/"]

ENTRYPOINT  ["/docker/entrypoint.sh"]
