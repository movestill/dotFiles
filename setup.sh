#!/bin/bash

# Create symbolic links in the user folder to these dot files.
# Execute from the root of the repo.

# Get script's working directory.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.tmux.conf ~/.tmux.conf
ln -s $DIR/.gitconfig ~/.gitconfig
ln -s $DIR/_vim ~/.vim
ln -s $DIR/pycharm/.ideavimrc ~/.ideavimrc
