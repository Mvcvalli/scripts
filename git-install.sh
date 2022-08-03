#!/usr/bin/env bash

# Installing dots.
git clone --depth 1 https://github.com/Mvcvalli/dotfiles.git

# Installing nvim config.
cd  ~/dotfiles/.config
git clone --depth 1 https://github.com/Mvcvalli/nvim.git
cd ~

# Installing vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      
