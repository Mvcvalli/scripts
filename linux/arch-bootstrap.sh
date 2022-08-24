#!/usr/bin/env bash

echo "An internet connection is needed to use this script."
echo "Before running this script make sure to adapt it to your needs and preferences before using it."
echo "This script to work it must be in your home directory"
echo ' '
echo "Press [ENTER] key when ready to continue"
read y

# Give sudo privileges ahead of time, so that we hopefully only have to enter a password once.
sudo -v

echo ''
echo "Starting install..."
echo ''

# Moving to home directory.
cd ~

# Update system
sudo pacman -Syu

# Set up YAY (AUR Helper)
sudo pacman -S git base-devel
cd ~/.config
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

# Installing packages
pacman=(
alacritty
neovim
vim
mpv
fish
exa
python-pip
xdg-user-dirs
zathura
zathura-djvu
zathura-pdf-mupdf
)

yay=(
newsboat-git
librewolf
)

pip=(
ueberzug
)

sudo pacman -S ${pacman[@]}
yay -S ${yay[@]}
sudo pip3 install ${pip[@]}

# Installing dotfiles.
mkdir Repo
cd Repo
git clone --depth 1 https://github.com/Mvcvalli/dotfiles.git
cd ~

# Installing nvim config.
cd ~/Repo/dotfiles/.config
git clone --depth 1 https://github.com/Mvcvalli/nvim.git
cd ~

# Removing unnecessary files
rm -rf .config # One could exist, idk.
rm -rf .local  # Again, one could exist, idk.
cd ~/Repo/dotfiles/.config/nvim
rm -rf .git

# Moving shit around
mv ~/Repo/dotfiles/.config ~/
mv ~/Repo/dotfiles/.newsboat ~/
mv ~/Repo/dotfiles/.vimrc ~/
cd ~

# Installing vim-plug (Vim)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Installing vim-plug (Neovim)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Installing vim & nvim plugins.
nvim -c "PlugInstall|q|q"
vim -c "PlugInstall|q|q"

# Removing unnecessary files
cd ~
rm -rf Repo

echo ''
echo "Install complete..."
