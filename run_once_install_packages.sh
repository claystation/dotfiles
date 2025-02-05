#!/bin/bash

# Packages
sudo pacman -Syu --needed \
	neovim \
	firefox \
	unzip \
	rofi \
	polybar \
	code \
	docker \
	kubectl \
	helm \
	kubectx \
	fluxcd \
	kitty

# Change Shell
if [ $SHELL != $(which zsh) ]; then
    chsh -s $(which zsh)
fi

# Install Oh My Zsh
# https://ohmyz.sh/#install
if ! [ -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Nerd Fonts
mkdir -p ~/.local/share/fonts

if ! [ -d ~/.local/share/fonts/Hack ]; then
    wget -O ~/Downloads/Hack.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
    unzip ~/Downloads/Hack.zip -d ~/.local/share/fonts/Hack
    rm ~/Downloads/Hack.zip
    fc-cache -fv
fi


# asdf VM
if ! [ -d ~/.local ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
fi

asdf plugin add golang
asdf install golang latest
