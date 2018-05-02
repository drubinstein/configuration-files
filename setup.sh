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
        for conf in ".vim" ".tmux.conf" ".zshrc" ".dir_colors" ".oh-my-zsh"; do
            ln -sf ~/${conf} ${CONFIG_ROOT}/${conf}
        done
        ln -sf ~/.vim/basic.vim ${CONFIG_ROOT}/vimrc/vimrcs/basic.vim
    else
        # BSD
        echo "BSD Detected"
        for conf in ".vim" ".tmux.conf" ".zshrc" ".dir_colors" ".oh-my-zsh"; do
            ln -sf ${CONFIG_ROOT}/${conf} ~/${conf}
        done
        ln -sf ${CONFIG_ROOT}/vimrc/vimrcs/basic.vim ~/.vim/basic.vim
    fi

    # Setup vim
    vim +PlugInstall +qa
}

$1
