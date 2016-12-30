#!/bin/sh

source libs.sh

echo "###############################################################################"
echo "# Copy dotfiles into place"
echo "###############################################################################"

echo ""
echo "Copying dotfiles into place"
cp -ar .config/ ~/
cp -a .editorconfig ~/
cp -a .hyper.js ~/
cp -a .vimrc ~/
