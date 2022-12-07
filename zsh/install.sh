#!/usr/bin/env bash

# Plugin Manager (Zap)
sh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.sh)

# Installing ZSH config. 
cd ~/.config
git clone --depth 1 https://github.com/Mvcvalli/zsh.git
