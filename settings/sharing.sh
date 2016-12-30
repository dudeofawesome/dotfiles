#!/bin/sh

source ../libs.sh

echo "###############################################################################"
echo "# Sharing"
echo "###############################################################################"

echo ""
echo "Remote Login (SSH)"
systemsetup -setremotelogin on
dseditgroup -o create -q com.apple.access_ssh
dseditgroup -o edit -a admin -t group com.apple.access_ssh
