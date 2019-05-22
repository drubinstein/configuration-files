# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

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
  jsontools
)

source ${ZSH}/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/drubinstein/gcloud/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/drubinstein/gcloud/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/drubinstein/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/drubinstein/gcloud/google-cloud-sdk/completion.zsh.inc'; fi

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

export PATH=/usr/local/opt/ccache/libexec:/usr/local/bin:/usr/local/sbin:$PATH

eval "$(pyenv init -)"

export CMAKE_EXPORT_COMPILE_COMMANDS=ON
export USE_CCACHE=true
export CCACHE_CPP2=yes
