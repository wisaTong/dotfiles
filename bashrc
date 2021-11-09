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
export PATH="$CARGO_HOME/bin:$PATH"  # cargo binary
export PATH="/home/wendel/go/bin:$PATH" # go binary

# Put your fun stuff here.
alias l='ls --group-directories-first -alshAX'
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -Iv'
alias mkdir='mkdir -pv'


# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion
# doas completion
complete -cf doas
# disable special char escape
shopt -s direxpand

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

source "/home/wendel/.local/share/cargo/env"
# load LaTex env
source $XDG_CONFIG_HOME/texlive/texmfrc

export PATH=$PATH:/home/wendel/bin

# az auto complete
source '/home/wendel/.local/share/azure-cli/az.completion'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/wendel/app/google-cloud-sdk/path.bash.inc' ]; then . '/home/wendel/app/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/wendel/app/google-cloud-sdk/completion.bash.inc' ]; then . '/home/wendel/app/google-cloud-sdk/completion.bash.inc'; fi

# dotnet bullshit
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:/$DOTNET_ROOT

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/wendel/.local/share/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/wendel/.local/share/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/wendel/.local/share/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/wendel/.local/share/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
