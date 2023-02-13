#!/usr/bin/env bash

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
