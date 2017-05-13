#!/bin/bash

source "../libs.sh"

echo "###############################################################################"
echo "# Audio"
echo "###############################################################################"

echo ""
echo "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo ""
echo "Enable the chime sound effect on boot"
sudo nvram BootAudio=%01
