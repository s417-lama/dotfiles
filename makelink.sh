#!/bin/sh

DIR=$(cd $(dirname $0) && pwd)

ln -sf $DIR/.tmux.conf ~/.tmux.conf
ln -sf $DIR/.gitignore_global ~/.gitignore_global
ln -sf $DIR/.gitconfig ~/.gitconfig
mkdir -p ~/.config
ln -snf $DIR/.vim/colors ~/.config/nvim
mkdir -p ~/.tmux
ln -snf $DIR/.tmux/tmuxline.conf ~/.tmux/tmuxline.conf
mkdir -p ~/.config/fish
ln -snf $DIR/.config/fish/config.fish ~/.config/fish/config.fish
mkdir -p ~/.cgdb
ln -snf $DIR/.cgdb/cgdbrc ~/.cgdb/cgdbrc
mkdir -p ~/.config/nvim
ln -snf $DIR/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -snf $DIR/.vim/colors ~/.config/nvim/colors
