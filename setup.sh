#!/bin/sh

function update(){
    git submodule update
}

function setup(){
    git submodule init
    update

    echo "Installing oh-my-zsh. Note this will set the default shell to zsh"
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

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
    else
        # BSD
        echo "BSD Detected"
        for conf in ".vim" ".tmux.conf" ".zshrc"; do
            ln -sf ${CONFIG_ROOT}/${conf} ~/${conf}
        done
        ln -sf ${CONFIG_ROOT}/vimrc/vimrcs/basic.vim ~/.vim/basic.vim
    fi

    # Setup vim
    echo "Installing vim plugins"
    vim +PlugInstall +qa

    # Install powerline fonts
    # clone
    git clone https://github.com/powerline/fonts.git --depth=1
    # install
    cd fonts
    ./install.sh
    # clean-up a bit
    cd ..
    rm -rf fonts
    echo "To use oh-my-zsh with powerline set your terminal's font to a powerline font"
}

$1
