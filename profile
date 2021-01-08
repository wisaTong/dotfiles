# /etc/skel/.bash_profile

# cleanup
export LESSHISTFILE=-
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export PSQL_HISTORY="$XDG_CACHE_HOME"/pg/psql_history
export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export HISTFILE="$XDG_DATA_HOME"/bash/history

alias wget='wget --hsts-file="$XDG_CACHE_HOME"/wget-hsts'

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]]; then
	. ~/.bashrc
fi

# startx
if [ -z $DISPLAY ] && [ $(tty) = "/dev/tty1" ]; then
	exec startx
fi

