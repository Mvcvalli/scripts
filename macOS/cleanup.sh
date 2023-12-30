#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive sudo until `clenaup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

oldAvailable=$(df / | tail -1 | awk '{print $4}')

echo ' '
echo "Emptying the Trash on all mounted volumes and the main HDD."
echo "Also, clearing Apple’s System Logs to improve shell startup speed."
echo "Finally, clear download history from quarantine."
sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'

echo 'Clear System Log Files...'
sudo rm -rfv /private/var/log/asl/*.asl &>/dev/null
sudo rm -rfv /Library/Logs/DiagnosticReports/* &>/dev/null
sudo rm -rfv /Library/Logs/Adobe/* &>/dev/null
rm -rfv ~/Library/Containers/com.apple.mail/Data/Library/Logs/Mail/* &>/dev/null
rm -rfv ~/Library/Logs/CoreSimulator/* &>/dev/null

echo ' '
echo "Cleaning up LaunchServices to remove duplicates in the “Open With” menu"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder

echo ' '
echo "Recursively deleting ".DS_Store" files..."
sudo find . -type f -name '*.DS_Store' -ls -delete
rm -rf ~/.DS_Store #Always seems to miss the file in my home directory.

echo ' '
echo "Cleaning caches & directories..."
brew autoremove
brew cleanup -s
brew -v cleanup --prune=2
rm -rf "$(brew --cache)"

echo ' '
echo "Delete Empty Files and Directories."
sudo find . -type d -empty -print -delete -o -type f -empty -print -delete

echo ' '
echo "All done!"
