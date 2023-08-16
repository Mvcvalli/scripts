#!/usr/bin/env bash

echo "An internet connection is needed to use this script."
echo "Before running this script make sure to adapt it to your needs and preferences before using it."
echo "This script to work it must be in your home directory"
echo ' '
echo "Press [ENTER] key when ready to continue"
read y

sudo -v # Give sudo privileges ahead of time, so that we hopefully only have to enter a password once
cd ~ 	  # Moving to home directory at the beginning of the process

echo "Installing Xcode..."
xcode-select --install

# Checking for Homebrew. Install if we don't have it.
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Updating homebrew..."
brew update && brew upgrade

echo "Installing packages..."
brew=(
git
vim
fish
exa
newsboat
)

cask=(
alacritty
mailspring
librewolf
raycast
mpv
onyx
font-hack-nerd-font
font-iosevka-nerd-font
noto-fonts-emoji
)

brew install ${brew[@]}        #Homebrew App Installer
brew install --cask ${cask[@]} #Casks Installer

echo "Installing dotfiles..."
mkdir Repo && cd Repo
git clone --depth 1 https://github.com/Mvcvalli/dotfiles.git
cd ~

# Removing unnecessary files.
rm -rf .config # One could exist, idk.
rm -rf .local  # Again, one could exist, idk.
cd ~/Repo/dotfiles/.config/nvim
rm -rf .git
cd ~

# Moving shit around
mv ~/Repo/dotfiles/.config ~/
mv ~/Repo/dotfiles/.newsboat ~/
mv ~/Repo/dotfiles/.vimrc ~/
cd ~

cd ~
rm -rf Repo

echo ''
echo "Install complete"
