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
rm -rf Repo

# Installing Scripts.
mkdir .local
cd ~/.local
git clone --depth 1 https://github.com/Mvcvalli/scripts.git
cd scripts
chmod +x script-install-script
cd linux/debian
chmod +x cleanup fonts github-desktop librewolf-install setup-install update xfce-plugins
cd ..
cd arch
chmod +x postinstall update
cd ..
cd xdg
chmod +x mime user-dirs
cd ../..
cd macOS
chmod +x bootstrap.sh cleanup.sh dots-unzip git-install.sh update.sh
cd $HOME

# Installing vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Fish Shell
clear & fish
fish_add_path /usr/local/sbin
