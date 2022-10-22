#!/usr/bin/env bash

sudo -v # Give sudo privileges ahead of time, so that we hopefully only have to enter a password once.
cd ~    # Moving to home directory at the beginning of the process.

brew install nvim

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 
cd ~/.config
git clone --depth 1 https://github.com/Mvcvalli/nvim
cd ~
