#!/usr/bin/env bash

echo ' '
echo "Make sure to adapt this script to your needs and preferences before using it."
echo "An internet connection is needed to use this script."
echo ' '
echo "Press [ENTER] key when ready to continue."
read y

sudo -v  # Give sudo privileges ahead of time, so that we hopefully only have to enter a password once.
cd $HOME # Moving to home directory at the beginning of the process.

# Removing unnecessary files.
rm -rf .config # One could exist, idk.
rm -rf .local  # Again, one could exist, idk.
rm -rf .cache
rm -rf .newsboat
rm -rf .vim
cd $HOME

# Installing dotfiles.
mkdir Repo
cd Repo
git clone --depth 1 https://github.com/Mvcvalli/dotfiles.git
cd $HOME

# Moving shit around.
mv ~/Repo/dotfiles/.config ~/
mv ~/Repo/dotfiles/.newsboat ~/
mv ~/Repo/dotfiles/.vim ~/
cd $HOME

# Installing scripts.
mkdir .local
cd ~/.local
git clone --depth 1 https://github.com/Mvcvalli/scripts.git
cd scripts; rm -rf .git
cd linux/arch
chmod +x arch-bootstrap.sh; chmod +x arch-cleanup.sh; chmod +x arch-update.sh
cd ..
cd debian
chmod +x postinstall.sh
cd ..
cd ..
cd macOS
chmod +x bootstrap.sh; chmod +x cleanup.sh; chmod +x git-install.sh; chmod +x update.sh
cd nvim
chmod +x \ nvim-config-install.sh; chmod +x uninstall-nvim.sh
cd ..
cd ..
cd zsh
chmod +x install.sh

cd $HOME
rm -rf Repo
