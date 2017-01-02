#!/bin/bash

source ../libs.sh

echo "###############################################################################"
echo "# Transmission.app"
echo "###############################################################################"

echo ""
echo "Hiding the donate message"
defaults write org.m0k.transmission WarningDonate -bool false

echo ""
echo "Hiding the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false

echo ""
echo "Auto-resizing the window to fit transfers"
defaults write org.m0k.transmission AutoSize -bool true

echo ""
echo "Auto updating to betas"
defaults write org.m0k.transmission AutoUpdateBeta -bool true

echo ""
echo "Setting up the best block list"
defaults write org.m0k.transmission EncryptionRequire -bool true
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
