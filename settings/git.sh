#!/bin/bash

source ../libs.sh

echo "###############################################################################"
echo "# Git"
echo "###############################################################################"

echo ""
echo "Setting Git user"
git config --global user.name "Louis Orleans"
git config --global user.email "louis@orleans.io"

echo ""
echo "Setting Git to use VSCode as default editor"
git config --global core.editor "code -n -w"

# Create a nice last-change git log message, from https://twitter.com/elijahmanor/status/697055097356943360
git config --global alias.lastchange 'log -p --follow -n 1'
