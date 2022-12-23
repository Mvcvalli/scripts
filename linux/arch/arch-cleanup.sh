#!/usr/bin/env bash

sudo -v # Give sudo privileges ahead of time, so that we hopefully only have to enter a password once.
cd ~    # Moving to home directory at the beginning of the process.

echo ' ' 
echo "Syncing Database..."
sudo pacman -Syy

echo ' ' 
echo "Cleaning Pacman Cache..." 
sudo pacman -Scc

echo ''
echo "Removing unused packages..."
sudo pacman -Rs $(pacman -Qdtq)
