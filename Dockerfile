FROM  progrium/busybox:latest
MAINTAINER  Sergyi Kukharyev <sergej.kucharev@gmail.com>
RUN  passwd -d root

RUN  adduser -s /bin/sh -D user user

RUN  mkdir -p -m a+r,u+w,g+w,a+x /data/ /docker/
ADD  docker /docker
RUN  chmod -R +x /docker/*.sh
ENTRYPOINT  ["/docker/entrypoint.sh"]

RUN  opkg-install opkg && opkg update
