#!/bin/bash

source "../libs.sh"

echo "###############################################################################"
echo "# Dock"
echo "###############################################################################"

echo ""
cecho "Wipe all (default) app icons from the Dock and add a different set? (y/n)" $yellow
tput bel
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write com.apple.dock persistent-apps -array "$(cat files/dock-apps.plist)"
  defaults write com.apple.dock persistent-others -array "$(cat files/dock-folders.plist)"
fi

echo ""
echo "Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 28

if $SINGLE_SCREEN; then
  echo ""
  echo "Turn Dock hiding on"
  defaults write com.apple.Dock autohide -int 1

  if ! $DESKTOP; then
    echo ""
    echo "Positioning Dock on left of screen"
    defaults write com.apple.Dock orientation left
  fi
fi

echo ""
echo "Reduce the auto-hiding delay in Dock"
defaults write com.apple.dock autohide-delay -float 0.1
defaults write com.apple.dock autohide-time-modifier -float 0.4

echo ""
echo "Minimize windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true
