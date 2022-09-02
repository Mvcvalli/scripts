#!/usr/bin/env bash

echo "An internet connection is needed to use this script."
echo "Before running this script make sure to adapt it to your needs and preferences before using it."
echo "This script to work it must be in your home directory"
echo ' '
echo "Press [ENTER] key when ready to continue"
read y

# Give sudo privileges ahead of time, so that we hopefully only have to enter a password once.
sudo -v

echo ''
echo "Starting install..."
echo ''

# Moving to home directory.
cd ~

# Update system
sudo pacman -Syu

# Set up YAY (AUR Helper)
sudo pacman -S git base-devel
cd ~/.config
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

# Installing packages
pacman=(
alacritty
vim
mpv
fish
exa
xdg-user-dirs
zathura
zathura-djvu
zathura-pdf-mupdf
)

yay=(
newsboat-git
librewolf
kwin-bismuth
)

sudo pacman -S ${pacman[@]}
yay -S ${yay[@]}

# Removing unnecessary files.
cd ~
rm -rf .config

# Installing dotfiles.
mkdir Repo
cd Repo
git clone --depth 1 https://github.com/Mvcvalli/.dotfiles.git
cd ~

# Moving shit around
mv ~/Repo/.dotfiles/.config ~/
mv ~/Repo/.dotfiles/.newsboat ~/
mv ~/Repo/.dotfiles/.vimrc ~/
mv ~/Repo/.dotfiles/.bash_profile ~/
mv ~/Repo/.dotfiles/.bashrc ~/
cd ~

# Installing ble.sh
git clone --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc

# Installing vim-plug (Vim)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Installing vim plugins.
vim -c "PlugInstall|q|q"

# Removing unnecessary files
cd ~
rm -rf Repo

echo ''
echo "Install complete..."
