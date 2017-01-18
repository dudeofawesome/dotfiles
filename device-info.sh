#!/bin/bash

source "libs.sh"

HACKINTOSH=false
DESKTOP=true
SINGLE_SCREEN=true
UNLIMITED_DISK=false

echo ""
cecho "Is this computer a Hackintosh? (y/n)" $yellow
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  HACKINTOSH=true
fi

echo ""
cecho "Is this a desktop computer? (y/n)" $yellow
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  DESKTOP=true
else
  DESKTOP=false
fi

echo ""
cecho "Is this computer used primarily with a single screen? (y/n)" $yellow
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  SINGLE_SCREEN=true
else
  SINGLE_SCREEN=false
fi

echo ""
cecho "Is there somewhat limited disk space available? (y/n)" $yellow
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  UNLIMITED_DISK=true
else
  UNLIMITED_DISK=false
fi

echo ""
cecho "Would you like to set your computer name (as done via System Preferences → Sharing)? (y/n)" $yellow
tput bel
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "What would you like it to be?"
  read COMPUTER_NAME
fi
