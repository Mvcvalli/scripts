#!/usr/bin/env bash

cd ~/.local

git clone https://github.com/Mvcvalli/scripts.git

cd scripts

rm -rf .git

cd linux/arch

chmod +x arch-bootstrap.sh arch-cleanup.sh arch-update.sh

cd ..

cd debian

chmod +x postinstall.sh

cd ..

cd ..

cd macOS

chmod +x bootstrap.sh cleanup.sh git-install.sh update.sh

cd nvim

chmod +x ~/.local/scripts/macOS/nvim/\ nvim-config-install.sh
chmod +x uninstall-nvim.sh

cd ..
cd ..

cd zsh

c
