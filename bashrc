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

export TERMINAL='urxvtc'
export PATH="$PATH:$HOME/.local/bin"

# xdg home dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOE=$HOME/.local/state

# quality of life stuff
export LESSHISTFILE=-
export HISTFILE=$XDG_DATA_HOME/bash/history
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority

# Put your fun stuff here.
alias l='ls --group-directories-first -alshAX'
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -Iv'

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion
# disable special char escape
shopt -s direxpand

# Disable Ctrl + S terminal pause
stty -ixon 

export PS1='\[\033[32m\]\u@\h \[\e[1;34m\]\w\[\e[33m\] \[\e[1;35m\]λ\[\e[0m\] '

for f in $XDG_CONFIG_HOME/bashrc.d/*; do source $f; done
