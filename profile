# /etc/skel/.profile

# xdg base dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# xdg compat
export LESSHISTFILE=-
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history
export PSQL_HISTORY=$XDG_CACHE_HOME/pg/psql_history
export RXVT_SOCKET=$XDG_RUNTIME_DIR/urxvtd
export URXVT_PERL_LIB=$XDG_CONFIG_HOME/urxvt/perl
export VSCODE_PORTABLE=$XDG_DATA_HOME/vscode
export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority
export HISTFILE=$XDG_DATA_HOME/bash/history
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"
export REDISCLI_HISTFILE=$XDG_DATA_HOME/redis/rediscli_history
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/pass
export GNUPGHOME=$XDG_DATA_HOME/gnupg

# alias wget='wget --hsts-file="$XDG_CACHE_HOME"/wget-hsts'

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]]; then
	. ~/.bashrc
fi

# startx
if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
	exec startx
fi
source "/home/wendel/.local/share/cargo/env"
