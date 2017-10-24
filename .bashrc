# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

export HISTCONTROL=ignoreboth:erasedups

alias tmux='tmux -2'
alias ll='ls -l'
alias la='ls -al'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gg='git gui'
alias gl='git log --oneline --decorate --graph'
alias gp='git push origin master'
alias gu='git pull origin master && git submodule update --recursive'

QT_PLUGIN_PATH="${QWT_ROOT}/plugins:$QT_PLUGIN_PATH"
export QT_PLUGIN_PATH

#export PATH=/home/juan/ti/gcc-linaro-6.2.1-2016.11-x86_64_arm-linux-gnueabi/bin:$PATH
#export TI_SDK_PATH=/home/juan/ti/ti-sdk-omapl138-lcdk-01.00.00
export PATH=$PATH:/home/juan/ti/ti-processor-sdk-linux-omapl138-lcdk-04.00.00.04/linux-devkit/sysroots/x86_64-arago-linux/usr/bin
