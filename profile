# /etc/skel/.profile
#
# provide some of XDG compat config. Uncomment to enable.

# xdg base dirs
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# xdg data
# export LESSHISTFILE=-
# export CARGO_HOME=$XDG_DATA_HOME/cargo
# export RUSTUP_HOME=$XDG_DATA_HOME/rustup
# export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history
# export VSCODE_PORTABLE=$XDG_DATA_HOME/vscode
# export HISTFILE=$XDG_DATA_HOME/bash/history
# export REDISCLI_HISTFILE=$XDG_DATA_HOME/redis/rediscli_history
# export PASSWORD_STORE_DIR=$XDG_DATA_HOME/pass
# export GNUPGHOME=$XDG_DATA_HOME/gnupg
# export URXVT_PERL_LIB=$XDG_DATA_HOME/urxvt/perl

## config
# export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"
# export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
# export AZURE_CONFIG_DIR=$XDG_DATA_HOME/azure
# export CONDARC=$XDG_CONFIG_HOME/conda/condarc
# export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker

## cache + runtime
# export PSQL_HISTORY=$XDG_CACHE_HOME/pg/psql_history
# export RXVT_SOCKET=$XDG_RUNTIME_DIR/urxvtd
# export XAUTHORITY=$XDG_RUNTIME_DIR/Xauthority

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
