sudo -v

echo ' '
echo 'Updating Packages...'
echo ' '

brew update
brew upgrade 

echo ' '

brew update --cask --greedy
brew upgrade --cask --greedy

echo ' '
echo 'Cleaning caches & directories...'
echo ' '

brew cleanup -s #Clearing home-brew cache
brew -v cleanup --prune=2

echo ' ' 
echo 'Empties the Trash on all mounted volumes and the main HDD. Also, clear Apple’s System Logs to improve shell startup speed. Also clears download history from quarantine'
echo ' ' 

sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'

echo ' '
echo 'Recursively deleting `.DS_Store` files'
echo ' '

sudo find . -type f -name '*.DS_Store' -ls -delete
