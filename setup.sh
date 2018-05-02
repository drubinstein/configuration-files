#!/bin/sh

function update(){
    git submodule update
}

function setup(){
    git submodule init
    update
    # Setup symlinks for easier updates
    CONFIG_ROOT="$( cd "$(dirname "$0")" ; pwd -P )"

    # check if ln is GNU or BSD
    if ln --version 2>/dev/null | grep -q 'oreutils'; then
        # GNU
        echo "GNU detected"
        for conf in ".vim" ".tmux.conf" ".zshrc"; do
            ln -sf ~/${conf} ${CONFIG_ROOT}/${conf}
        done
        ln -sf ~/.vim/basic.vim ${CONFIG_ROOT}/vimrc/vimrcs/basic.vim
        ln -sf ~/.oh-my-zsh ${CONFIG_ROOT}/oh-my-zsh
    else
        # BSD
        echo "BSD Detected"
        for conf in ".vim" ".tmux.conf" ".zshrc"; do
            ln -sf ${CONFIG_ROOT}/${conf} ~/${conf}
        done
        ln -sf ${CONFIG_ROOT}/vimrc/vimrcs/basic.vim ~/.vim/basic.vim
        ln -sf ${CONFIG_ROOT}/oh-my-zsh ~/.oh-my-zsh
    fi

    # Setup vim
    echo "Installing vim plugins"
    vim +PlugInstall +qa

    echo "Setting ZSH to default shell. If you use mac I recommend you run brew install zsh before running this step."
    chsh -s $(which zsh)
}

$1
