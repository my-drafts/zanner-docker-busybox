#!/bin/sh

echo "";
echo "init alias";

touch /root/.profile
echo "alias ll='ls -als'" >> /root/.profile
echo "alias '..'='cd ..'" >> /root/.profile

#export PS1="[\[\e[0;33m\]\u@\h\[\e[m\]] \[\e[1;35m\]\w\[\e[m\] \[\e[0;36m\]>\[\e[m\]"
#export PS2=">"

#init_file=(readlink -f $0); #current file
#(set -o posix; set) # see all defined variabled
#alias ll="ls -als"
#alias ".."="cd .."
