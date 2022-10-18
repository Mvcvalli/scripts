#!/usr/bin/env bash

echo ' '
echo "Make sure to adapt this script to your needs and preferences before using it."
echo "An internet connection is needed to use this script."
echo ' '
echo "Press [ENTER] key when ready to continue"
read y

echo ''
echo "Starting install..."
echo ''

sudo -v # Give sudo privileges ahead of time, so that we hopefully only have to enter a password once.
cd ~    # Moving to home directory at the beginning of the process.

# Installing dotfiles.
mkdir Repo
cd Repo
git clone --depth 1 https://github.com/Mvcvalli/dotfiles.git
cd ~

# Removing unnecessary files
rm -rf .config # One could exist, idk.
rm -rf .local  # Again, one could exist, idk.

# Moving shit around
mv ~/Repo/dotfiles/.config ~/
mv ~/Repo/dotfiles/.newsboat ~/
mv ~/Repo/dotfiles/.vim ~/
cd~

# Installing vim-plug (Vim)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
       
# Installing Vim plugins.
vim -c "PlugInstall|q|q"

# Installing scripts.
cd ~/.local
git clone --depth 1 https://github.com/Mvcvalli/scripts.git
cd scripts
rm -rf .git linux zsh
cd macOS chmod +x git-install.sh update.sh
cd .. & cd nvim
chmod +x nvim-config-install.sh

cd ~
rm -rf Repo

echo ''
echo "Install complete"
