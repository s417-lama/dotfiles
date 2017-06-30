#!/bin/sh

DIR=$(cd $(dirname $0) && pwd)

ln -sf $DIR/.vimrc ~/.vimrc
ln -sf $DIR/.tmux.conf ~/.tmux.conf
ln -snf $DIR/.vim/colors ~/.vim
ln -snf $DIR/.tmux/tmuxline.conf ~/.tmux/tmuxline.conf
