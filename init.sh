#!/bin/bash
set -e

DOTFILES_DIR=$(readlink -f `dirname $0`)
cd $DOTFILES_DIR

# init submodules
git submodule init
git submodule update

# other configs
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/ctags ~/.ctags

