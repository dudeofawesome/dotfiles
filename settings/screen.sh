#!/bin/bash

source ../libs.sh

echo "###############################################################################"
echo "# Screen"
echo "###############################################################################"

echo ""
echo "Enabling sub-pixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo ""
echo "Enabling HiDPI display modes (requires restart)"
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
