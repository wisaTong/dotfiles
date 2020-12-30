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
export EDITOR='vim'

# Put your fun stuff here.
alias l='ls -alsh'
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'

wallp() {
	ln -sf $(readlink -f $1) $HOME/.config/wallpaper
	xwallpaper --zoom $HOME/.config/wallpaper
}

# Autorun

# pfetch env
PF_INFO="title os host kernel uptime pkgs memory shell editor wm palette" pfetch

