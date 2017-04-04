FROM progrium/busybox:latest
MAINTAINER Sergyi Kukharyev <sergej.kucharev@gmail.com>
RUN passwd -d root
RUN mkdir -pv -m a+r,u+w,g+w,a+x /data/ /docker/
RUN touch /docker/entrypoint.sh
RUN chmod -R +x /docker/entrypoint.sh
ENTRYPOINT ["/docker/entrypoint.sh"]
RUN echo "#!/bin/sh" >> /docker/entrypoint.sh
RUN echo "export alias ll='ls -als'" >> /docker/entrypoint.sh
RUN echo "export alias ..='cd ..'" >> /docker/entrypoint.sh
#image =4.8mb

RUN opkg-install opkg && opkg update
#image +1.2mb --> ~6.0mb

# editor
RUN opkg install vim
#image +1.0mb --> ~7.0mb

# ssh server + client
RUN opkg install dropbear
RUN rm /etc/dropbear/dropbear_rsa_host_key
RUN echo "Wellcome to ${hostname}!" > /etc/banner
RUN echo "dropbear -R -w -p 22" >> /docker/entrypoint.sh
EXPOSE 22
#image +100kb --> ~7.1mb

# time syncronization
RUN opkg install ntpclient
#image +100mb -> ~7.2mb

# cpu & mem usage
RUN opkg install htop
#image +100mb --> ~7.3mv

RUN echo "/bin/sh" >> /docker/entrypoint.sh

