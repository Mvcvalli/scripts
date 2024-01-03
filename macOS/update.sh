#!/usr/bin/env bash

# Keep-alive sudo until "update.sh" has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    oldAvailable=$(df / | tail -1 | awk '{print $4}')

# Give sudo privileges ahead of time, so that we hopefully only have to enter a password once.
    sudo -v

# Moving to home directory at the beginning of the process.
    cd $HOME

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
echo "All done!"
