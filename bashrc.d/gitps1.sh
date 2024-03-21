# PS1
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

if ! command -v git &> /dev/null; then
  echo "git not found, no change to PS1"
else
  export PS1='\[\033[32m\]\u@\h \[\e[1;34m\]\w\[\e[33m\]$(__git_branch)$(__git_status) \[\e[1;35m\]λ\[\e[0m\] '
fi
