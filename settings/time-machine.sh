#!/bin/sh

source ../libs.sh

echo "###############################################################################"
echo "# Time Machine"
echo "###############################################################################"

echo ""
echo "Prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
