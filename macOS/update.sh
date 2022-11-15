#!/usr/bin/env bash

sudo -v #Give sudo privileges ahead of time, so that we hopefully only have to enter a password once.
cd ~    #Moving to home directory at the beginning of the process

echo "Apps to update:"
brew outdated
brew outdated --cask --greedy

echo ' ' 
echo "Updating Applications..."
brew upgrade 
brew update
brew update --cask --greedy
brew upgrade --cask --greedy

echo ' ' 
echo "Cleaning caches & directories..."
brew cleanup -s
brew -v cleanup --prune=2

echo ' ' 
echo "Updating Vim Plugins..."
vim -c "PlugClean|q|q"
vim -c "PlugUpgrade|q|q"
vim -c "PlugUpdate|q|q"

echo ' ' 
echo "Recursively deleting `.DS_Store` files..."
sudo find . -type f -name '*.DS_Store' -ls -delete

echo ' ' 
echo "Cleaning up LaunchServices to remove duplicates in the “Open With” menu"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder

echo ' ' 
echo "Emptying the Trash on all mounted volumes and the main HDD."
echo "Also, clearing Apple’s System Logs to improve shell startup speed."
echo "Finally, clear download history from quarantine."
sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'

echo ' ' 
echo "All done!" 
