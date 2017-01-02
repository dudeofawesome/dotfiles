#!/bin/bash

source ../libs.sh

echo "###############################################################################"
echo "# Audio"
echo "###############################################################################"

echo ""
echo "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
