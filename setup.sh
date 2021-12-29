#!/bin/sh

# TODO: This is linux specific. Should write one that sets up brew and such at some point.

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
#    if ln --version 2>/dev/null | grep -q 'oreutils'; then
        # GNU
        echo "GNU detected"
        for conf in ".gitconfig" ".vim" ".tmux.conf" ".zshrc"; do
            #ln -sf ~/${conf} ${CONFIG_ROOT}/${conf}
            ln -sf ${CONFIG_ROOT}/${conf} ~/${conf} 
        done
        ln -sf  ${CONFIG_ROOT}/vimrc/vimrcs/basic.vim ~/.vim/basic.vim
#    else
        # BSD
#        echo "BSD Detected"
#        for conf in ".gitconfig" ".vim" ".tmux.conf" ".zshrc"; do
#            ln -sf ${CONFIG_ROOT}/${conf} ~/${conf}
#        done
#        ln -sf ${CONFIG_ROOT}/vimrc/vimrcs/basic.vim ~/.vim/basic.vim
#    fi

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

    # TODO: Consider putting the download-install latest bits into some function
    # Alternatively, maybe I should just learn nix

    # install Node version manager and install lts release
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    source ~/.zshrc
    nvm install --lts
    nvm use --lts

    # Install Yarn version manager and its most recent version
    curl -s https://raw.githubusercontent.com/tophat/yvm/master/scripts/install.js | node
    source ~/.zshrc
    yvm install latest
    yvm use latest

    # Install Jenv (Java version manager) 
    git clone https://github.com/jenv/jenv.git ~/.jenv
    source ~/.zshrc

    # Install Pyenv (python version manager) and latest python
    curl https://pyenv.run | bash
    source ~/.zshrc
    latest_python_version=$(curl https://www.python.org/downloads/ | grep 'Download Python' | awk '{$1=$1;print}' | cut -d " " -f 5 | sed -r 's/(<\/a>)+$//' | grep -v '^$' | head -n 1)
    pyenv install ${latest_python_version}
}

$1
