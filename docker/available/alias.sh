#!/bin/sh

echo "init alias";
echo "";

export PS1="[\[\e[0;33m\]\u@\h\[\e[m\]] \[\e[1;35m\]\w\[\e[m\] \[\e[0;36m\]>\[\e[m\]"
export PS2=">"

alias ll="ls -als"
alias ".."="cd .."
