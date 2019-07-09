#!/bin/sh

DIR=$(cd $(dirname $0) && pwd)

ln -sf $DIR/.tmux.conf ~/.tmux.conf
ln -sf $DIR/.gitignore_global ~/.gitignore_global
ln -sf $DIR/.gitconfig ~/.gitconfig
mkdir -p ~/.tmux
ln -sf $DIR/.tmux/myline.conf ~/.tmux/myline.conf
mkdir -p ~/.config
ln -sf $DIR/.config/libinput-gestures.conf ~/.config/libinput-gestures.conf
mkdir -p ~/.config/fish
ln -sf $DIR/.config/fish/config.fish ~/.config/fish/config.fish
mkdir -p ~/.config/alacritty
ln -sf $DIR/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
mkdir -p ~/.cgdb
ln -sf $DIR/.cgdb/cgdbrc ~/.cgdb/cgdbrc
mkdir -p ~/.config/nvim
ln -sf $DIR/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf $DIR/.config/nvim/dein.toml ~/.config/nvim/dein.toml
ln -sf $DIR/.config/nvim/dein_lazy.toml ~/.config/nvim/dein_lazy.toml

TERM_SETTING="export TERM=xterm-256color"
grep -q "$TERM_SETTING" ~/.bashrc || echo $TERM_SETTING >> ~/.bashrc
