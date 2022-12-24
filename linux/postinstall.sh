#!/usr/bin/env bash

cd ~ 	# Moving to home directory.
sudo -v # Give sudo privileges ahead of time, so that we hopefully only have to enter a password once.

# Update System.
sudo apt update
sudo apt upgrade
sudo apt full-upgrade

# Installing Packages.
apt=(
git
zsh
vim
exa
alacritty
mpv
newsboat
cmatrix
)

sudo apt install -y ${apt[@]}

# Installing Dotfiles.
cd ~
git clone --depth 1 https://github.com/Mvcvalli/.dotfiles.git

# Dotfiles Setup.
cd .dotfiles
mv .newsboat .vim .gitattributes .gitconfig .zshenv ~/
cd .config
mv alacritty mpv vim zsh ~/.config

# Scripts Install
cd ~/.local
git clone --depth 1 https://github.com/Mvcvalli/scripts.git

# ZSH Plugin Manager Install
sh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.sh)

# Updating, Upgrading, etc.
sudo apt update
sudo apt upgrade
sudo apt autoremove
sudo apt autoclean

