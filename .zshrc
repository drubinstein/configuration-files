# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Command auto correction
ENABLE_CORRECTION="true"

# Make svn, git, etc. much faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Set timestamp format in history
HIST_STAMPS="yyyy-mm-dd"

plugins=(
  git
  svn
  brew
  docker-compose
  docker
  git-prompt
  systemd
  tmux
  vi-mode 
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

