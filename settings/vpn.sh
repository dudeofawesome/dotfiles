#!/bin/bash

source ../libs.sh

echo "###############################################################################"
echo "# VPN"
echo "###############################################################################"

echo ""
echo "Installing PIA configs"
pushd ~/Downloads
wget "https://www.privateinternetaccess.com/openvpn/openvpn.zip"
unzip openvpn.zip
cd openvpn
tput bel
open "US California.ovpn"
tput bel
open "US East.ovpn"
tput bel
open "US Midwest.ovpn"
tput bel
open "Switzerland.ovpn"
popd
