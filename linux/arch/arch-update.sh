#!/usr/bin/env bash

sudo -v #Give sudo privileges ahead of time, so that we hopefully only have to enter a password once
cd ~ 	#Moving to home directory at the beginning of the process

echo "Updating Applications..."
sudo pacman -Syu
yay -Syu

echo ' '
echo "Cleaning caches & directories..."
pacman -Sc
yay -Sc

echo ' '
echo 'Updating Complete...'
