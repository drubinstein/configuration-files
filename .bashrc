set editing-mode vi
set -o vi

# for git completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
    GIT_PS1_SHOWDIRTYSTATE=true
    export PS1='[\u@mbp \w$(__git_ps1)]\$ '
fi

export GIT_EDITOR="vim"
export EDITOR="vim"
export VISUAL="vim"

alias gitl="git log --oneline --decorate --graph"

export LC_ALL=en_US.UTF8
export LANG=en_US.UTF8
