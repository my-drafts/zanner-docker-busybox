FROM  progrium/busybox:latest
MAINTAINER  Sergyi Kukharyev <sergej.kucharev@gmail.com>
RUN  passwd -d root

RUN  mkdir -p -m a+r,u+w,g+w,a+x /data/ /docker/
ADD  docker /docker
RUN  chmod -R a+x /docker/*.sh

ADD  docker/etc/init.sh /docker/tmp/init.sh
RUN  chmod -R a+x /docker/tmp/init.sh

RUN  opkg-install opkg && opkg update

ENTRYPOINT  ["/docker/entrypoint.sh"]
