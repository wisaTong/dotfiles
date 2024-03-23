# /etc/skel/.profile
#
# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]]; then
	. ~/.bashrc
fi

# startx
if [ -z $DISPLAY ] && [ $(tty) = /dev/tty1 ]; then
	exec startx
fi
