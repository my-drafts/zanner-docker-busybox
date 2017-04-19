FROM  progrium/busybox:latest
LABEL maintainer "Sergyi Kukharyev <sergej.kucharev@gmail.com>"

RUN  passwd -d root
RUN  opkg-install opkg 2>/dev/null
RUN  opkg update

RUN  mkdir -p /docker
ADD  entrypoint.sh /docker/entrypoint.sh
ADD  entrypoint /docker/entrypoint
ADD  tmp /docker/tmp
RUN  find /docker -type d -print | xargs chmod 755
RUN  find /docker -type f -print | xargs chmod 644
RUN  find /docker -type f -print | grep ".sh" | xargs chmod a+x

RUN  mkdir -p -m 755 /data
VOLUME ["/data/"]

ENTRYPOINT  ["/docker/entrypoint.sh"]
