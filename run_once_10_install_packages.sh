#!/bin/sh

# Packages
sudo pacman -Syu neovim \
	thunderbird \
	firefox \
	unzip \
	rofi \
	feh

# AURs
pamac build --no-confirm slack-desktop spotify polybar

# VIM Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

