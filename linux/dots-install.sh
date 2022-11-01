#!/usr/bin/env bash

echo ' '
echo "Make sure to adapt this script to your needs and preferences before using it."
echo "An internet connection is needed to use this script."
echo ' '
echo "Press [ENTER] key when ready to begin install."
read y
echo ' '

sudo -v  # Give sudo privileges ahead of time, so that we hopefully only have to enter a password once.
cd $HOME # Moving to home directory at the beginning of the process.

# Installing dotfiles.
mkdir Repo && cd Repo
git clone --depth 1 https://github.com/Mvcvalli/.dotfiles.git
cd $HOME

# Removing unnecessary files.
rm -rf .config # One could exist, idk.
rm -rf .local  # Again, one could exist, idk.
rm -rf .newsboat

# Moving shit around.
mv ~/Repo/.dotfiles/.config ~/
mv ~/Repo/.dotfiles/.newsboat ~/
mv ~/Repo/.dotfiles/.vimrc ~/
mv ~/Repo/.dotfiles/.bash_profile ~/
mv ~/Repo/.dotfiles/.bashrc ~/

# Installing ble.sh
git clone --recursive https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc

# Installing vim-plug (Vim)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Installing scripts
cd .local
git clone --depth 1 https://github.com/Mvcvalli/scripts.git
cd scripts/linux
chmod +x arch-cleanup.sh arch-update.sh dots-install.sh arch-bootstrap.sh
cd .. && rm -rf macOS zsh 
cd nvim
chmod +x nvim-config-install.sh uninstall-nvim.sh
cd $HOME

# Installing vim plugins.
vim -c "PlugInstall|q|q"

cd $HOME
rm -rf Repo
