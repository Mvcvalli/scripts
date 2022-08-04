#!/usr/bin/env bash

# Moving to home directory 
cd ~

# Installing dots.
git clone --depth 1 https://github.com/Mvcvalli/dotfiles.git

# Installing nvim config.
cd  ~/dotfiles/.config
git clone --depth 1 https://github.com/Mvcvalli/nvim.git
cd ~

# Removing unnecessary files
cd ~/dotfiles
rm -rf LICENSE
rm -rf .git
cd ~/dotfiles/.config/nvim
rm -rf .git

# Installing vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      
