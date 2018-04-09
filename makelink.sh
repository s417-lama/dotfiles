#!/bin/sh

DIR=$(cd $(dirname $0) && pwd)

ln -sf $DIR/.tmux.conf ~/.tmux.conf
ln -sf $DIR/.gitignore_global ~/.gitignore_global
ln -sf $DIR/.gitconfig ~/.gitconfig
mkdir -p ~/.config/nvim
ln -snf $DIR/.vim/colors ~/.config/nvim
mkdir -p ~/.tmux
ln -sf $DIR/.tmux/tmuxline.conf ~/.tmux/tmuxline.conf
mkdir -p ~/.config/fish
ln -sf $DIR/.config/fish/config.fish ~/.config/fish/config.fish
mkdir -p ~/.cgdb
ln -sf $DIR/.cgdb/cgdbrc ~/.cgdb/cgdbrc
mkdir -p ~/.config/nvim
ln -sf $DIR/.config/nvim/init.vim ~/.config/nvim/init.vim
