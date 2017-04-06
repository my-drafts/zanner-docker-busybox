FROM  progrium/busybox:latest
MAINTAINER  Sergyi Kukharyev <sergej.kucharev@gmail.com>
RUN  passwd -d root


## entrypoint
RUN  mkdir -p -m a+r,a+x /data/ /docker/ /docker/entrypoint/
RUN  touch /docker/entrypoint.sh
RUN  echo "#!/bin/sh" >> /docker/entrypoint.sh
RUN  echo 'for file in $(ls /docker/entrypoint/*.sh); do sh ${file}; done' >> /docker/entrypoint.sh
RUN  echo "/bin/sh" >> /docker/entrypoint.sh
RUN  chmod +x /docker/entrypoint.sh
ENTRYPOINT  ["/docker/entrypoint.sh"]


## opkg
RUN  opkg-install opkg && opkg update
##image +1.2mb --> ~6.0mb


## editor
RUN  opkg install vim
##image +1.0mb --> ~7.0mb


## ssh server + client
RUN  opkg install dropbear
RUN  rm /etc/dropbear/dropbear_rsa_host_key
RUN  echo "Wellcome to ${hostname}!" > /etc/banner
RUN  touch /docker/entrypoint/dropbear.sh
RUN  echo '#!/bin/sh' >> /docker/entrypoint/dropbear.sh
RUN  echo 'dropbear -R -w -p 22' >> /docker/entrypoint/dropbear.sh
RUN  chmod +x /docker/entrypoint/dropbear.sh
EXPOSE  22
##image +100kb --> ~7.1mb


## alias
RUN  touch /docker/entrypoint/alias.sh
RUN  echo "#!/bin/sh" >> /docker/entrypoint/alias.sh
RUN  echo "echo '/docker/entrypoint/alias.sh'" >> /docker/entrypoint/alias.sh
RUN  echo "echo 'alias ll=\"ls -als\"' >> ~/.profile " >> /docker/entrypoint/alias.sh
RUN  echo "echo 'alias \"..\"=\"cd ..\"' >> ~/.profile " >> /docker/entrypoint/alias.sh
RUN  chmod +x /docker/entrypoint/alias.sh
##image =4.8mb


## time syncronization
#RUN  opkg install ntpclient
##image +100mb -> ~7.2mb


## cpu & mem usage
#RUN  opkg install htop
##image +100mb --> ~7.3mv
