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

# Merge resource

#************************ Put your fun stuff here. ***************************#
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source Xresources file
if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

# dotcf
alias dotcf='git --git-dir=$HOME/.dotfile/ --work-tree=$HOME'

# Kubectx completion
if [ -f /opt/kubectx/ ]; then
    source /opt/kubectx/completion/kubectx.bash
    source /opt/kubectx/completion/kubens.bash
fi

# Cargo
if [ -f "$HOME/.cargo/" ]; then
    export PATH="$PATH:/home/be99inner/.cargo/bin/:/home/be99inner/.local/"
fi

# Snap
if [ -f /var/lib/snapd/ ]; then
    export PATH=$PATH:/var/lib/snapd/snap/bin
fi
    
# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

# Vim
# if ! [ -x "$(command -v gvim)" ]; then
#     alias vim='gvim -v'
# fi
export EDITOR=vim

# User bin
export PATH="$PATH:$HOME/bin"
