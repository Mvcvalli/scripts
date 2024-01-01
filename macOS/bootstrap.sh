#!/bin/sh
# OSX Post Install Script

# Giving sudo privileges and moving to home directory.
sudo -v && cd ~ || exit

# Keep-alive sudo until "bootstrap.sh" has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install xcode command line tools
xcode-select --install

# Checking for Homebrew. Install if we don't have it.
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Updating and upgrading Homebrew.
brew update && brew upgrade

# Installing Packages>

brew=(
git
eza
nvim
fish
newsboat
coreutils
     )

cask=(
mailspring
alacritty
librewolf
raycast
onyx
mpv
     )

fonts=(
font-hack-nerd-font
font-iosevka-nerd-font
noto-fonts-emoji
      )

brew install ${brew[@]} # Homebrew App Installer.
brew install --cask --appdir="/Applications" ${cask[@]}  # Casks Installer.
brew tap caskroom/fonts && brew install --cask ${fonts[@]} # fonts Installer.

# Installing dotfiles.
cd ~/Documents || exit
git clone --depth 1 https://github.com/Mvcvalli/dotfiles.git
rm -rf .config && rm -rf .newsboat
ln -s ~/Documents/dotfiles/.config ~
ln -s ~/Documents/dotfiles/.newsboat ~
ln -s ~/Documents/dotfiles/.gitconfig ~
ln -s ~/Documents/dotfiles/.vim ~

# Updating, upgrading, and cleaning up.
brew upgrade && brew update
brew update --cask --greedy && brew upgrade --cask --greedy
brew cleanup -s && brew -v cleanup --prune=2
rm -rf "$(brew --cache)"

# Add fish shell to /etc/shells file.
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

# Change default shell to Fish.
chsh -s /usr/local/bin/fish
