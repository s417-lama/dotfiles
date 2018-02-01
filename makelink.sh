#!/bin/sh

DIR=$(cd $(dirname $0) && pwd)

ln -sf $DIR/.vimrc ~/.vimrc
ln -sf $DIR/.tmux.conf ~/.tmux.conf
ln -sf $DIR/.gitignore_global ~/.gitignore_global
ln -sf $DIR/.gitconfig ~/.gitconfig
ln -snf $DIR/.vim/colors ~/.vim
ln -snf $DIR/.vim/colors ~/.config/nvim
ln -snf $DIR/.tmux/tmuxline.conf ~/.tmux/tmuxline.conf
ln -snf $DIR/.config/fish/config.fish ~/.config/fish/config.fish
ln -snf $DIR/.cgdb/cgdbrc ~/.cgdb/cgdbrc
ln -snf $DIR/.config/nvim/init.vim ~/.config/nvim/init.vim
