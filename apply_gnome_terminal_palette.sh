#!/bin/sh

MY_PALETTE="['#3C3339', '#CC6666', '#8C9440', '#C48459', '#81A2BE', '#B294BB', '#8ABEB7', '#6C7A80', '#4D444A', '#DA7575', '#B5BD68', '#DE935F', '#93B2CD', '#BB9FC3', '#96C7C1', '#CDD0CE']"
MY_FOREGROUND='#CDD0CE'
MY_BACKGROUND='#352E33'

PROF_ID=$(gsettings get org.gnome.Terminal.ProfilesList default | sed "s/'//g")
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROF_ID}/ palette "$MY_PALETTE"
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROF_ID}/ foreground-color $MY_FOREGROUND
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PROF_ID}/ background-color $MY_BACKGROUND
