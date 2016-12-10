#!/bin/sh

# Include some basic libs
source libs.sh

# Set continue to false by default
CONTINUE=false

echo ""
cecho "┌─────────────────────────────────────────────┐" $red
cecho "│ ×-+       Hackintosh Install Script         │" $red
cecho "├─────────────────────────────────────────────┤" $red
cecho "│                                             │" $red
cecho "│        DO NOT RUN THIS SCRIPT BLINDLY       │" $red
cecho "│         YOU'LL PROBABLY REGRET IT...        │" $red
cecho "│                                             │" $red
cecho "│              READ IT THOROUGHLY             │" $red
cecho "│         AND EDIT TO SUIT YOUR NEEDS         │" $red
cecho "│                                             │" $red
cecho "└─────────────────────────────────────────────┘" $red
echo ""


echo ""
cecho "Have you read through the script you're about to run and " $yellow
cecho "understood that it will make changes to your computer? (y/n)" $yellow
tput bel
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" $green
  exit
fi

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Prepare UEFI boot
###############################################################################

echo ""
echo "Installing latest Clover, downloaded from SourceForge"
attempts=0
downloadClover() {
  if [ $attempts -ge 2 ]; then
    cecho "Download of clover has failed too many times!" $red
    cecho "Exiting" $red
    exit 1
  fi
  cd ~/Downloads
  wget "https://sourceforge.net/projects/cloverefiboot/files/latest/download?source=files" -O clover.zip
  unzip clover.zip
  mkdir sym
  cp $(ls | grep \.pkg\$) sym/
  if [ "$(md5 sym/*)" = "$(cat *.md5)" ]; then
    rm -rf sym
    # TODO: figure out how to fully automate selection of UEFI extensions
    sudo install -pkg sym/*.pkg -target /
  else
    ((attempts++))
    cecho "Download of clover failed $attempts times, retrying" $yellow
    cd ~/Downloads
    rm -rf clover.zip
    rm -rf clover
    downloadClover
  fi
}
downloadClover
cd ~

echo ""
echo "Mounting EFI partition"
mkdir /Volumes/efi
PRIMARYDISK=$(df -h / | grep -o "/dev/disk.")
sudo mount -t msdos "$PRIMARYDISK"s1 /Volumes/efi

echo ""
echo "Copying config.plist into /EFI/CLOVER/"
cd ~/Downloads
cp config.plist /Volumes/efi/EFI/CLOVER

echo ""
echo "Installing KEXTs"
cd ~/Downloads
# FakeSMC + Extensions
# AppleIntelE1000e.kext
# AtherosE2200Ethernet.kext
# NVMeGeneric.kext ?
# USBInjectAll.kext

echo ""
echo "Installing EFI extensions"
cd ~/Downloads
rm /Volumes/efi/EFI/CLOVER/drivers64UEFI/VBoxHfs-64.efi
# HFSplus.efi

echo ""
echo "Installing Clover macOS theme"
cd ~/Downloads
cp "El Capitan" /Volumes/efi/EFI/CLOVER/themes

echo ""
echo "Removing AppleTyMCEDriver.kext, which prevents booting with a Mac Pro system def"
# http://www.tonymacx86.com/mountain-lion-desktop-support/86807-ml-native-ivy-bridge-cpu-gpu-power-management.html
sudo rm -rf /System/Library/Extensions/AppleTyMCEDriver.kext

echo ""
echo "Installing CloverALC patch"
# https://github.com/toleda/audio_CloverALC/blob/master/README.md
cd ~/Downloads
wget "https://github.com/toleda/audio_CloverALC/blob/master/audio_cloverALC-120.command.zip?raw=true" -O "audio_cloverALC.command.zip"
unzip "audio_cloverALC.command.zip"
tput bel
./audio_cloverALC.command
