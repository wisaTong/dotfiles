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

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$CARGO_HOME/bin"  # cargo binary

# Put your fun stuff here.
alias l='ls -alsh'
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -Iv'
alias mkdir='mkdir -pv'

# Disable Ctrl + S terminal pause
stty -ixon 

__git_branch() {
  if git rev-parse --git-dir >/dev/null 2>&1; then
    local BRANCH=$(
      git symbolic-ref --short HEAD | \
      awk -v len=15 '{ if (length($0) > len) print substr($0, 1, len-3) ".."; else print; }'
    )
    echo " (${BRANCH})"
  fi
}

__git_status() {
  if [ -z $(__git_branch) ]; then
    return
  else
    STATUS=$(git status 2>&1)
    if [[ $STATUS = *'Untracked files'* || $STATUS = *'Changes not staged for commit'* ]]; then echo -n "?"; fi 
    if [[ $STATUS = *'Changes to be committed'* ]]; then echo -n "*"; fi
    if [[ $STATUS = *'Your branch is ahead'* ]]; then echo -n "^"; fi
  fi
}

export PS1='\[\033[32m\]\u@\h \[\e[1;34m\]\w\[\e[33m\]$(__git_branch)$(__git_status) \[\e[1;35m\]λ\[\e[0m\] '

# Autorun
PF_INFO="title os host kernel uptime pkgs memory shell editor wm palette" pfetch

