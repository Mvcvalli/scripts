#!/usr/bin/env bash

sudo -v

echo ' '
echo "Make sure to adapt this script to your needs and preferences before using it."
echo "An internet connection is needed to use this script."
echo ' '
echo "Press [ENTER] key when ready to continue"
read y

echo ''
echo "Starting install..."
echo ''

# Moving to home directory.
cd ~

# Installing dotfiles.
mkdir Repo
cd Repo
git clone --depth 1 https://github.com/Mvcvalli/dotfiles.git

# Installing nvim config.
cd ~/Repo/dotfiles/.config
git clone --depth 1 https://github.com/Mvcvalli/nvim.git
cd ~

# Removing unnecessary files
cd ~/Repo/dotfiles/.config/nvim
rm -rf .git
cd ~
rm -rf .config # One could exist, idk.
rm -rf .local  # Again, one could exist, idk.

# Moving shit around
mv ~/Repo/dotfiles/.config ~/
mv ~/Repo/dotfiles/.newsboat ~/
mv ~/Repo/dotfiles/.vimrc ~/

# Installing vim-plug (Vim)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Installing vim-plug (Neovim)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
# Installing vim & nvim plugins.
nvim -c "PlugInstall|q|q"
vim -c "PlugInstall|q|q"

cd ~
rm -rf Repo

echo ''
echo "Install complete"
