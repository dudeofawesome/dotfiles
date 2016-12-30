#!/bin/sh

source ../libs.sh

echo "###############################################################################"
echo "# Finder"
echo "###############################################################################"

echo ""
echo "Show icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

echo ""
echo "Don't show icons for internal hard drives on the desktop"
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

echo ""
echo "Show hidden files in Finder by default"
defaults write com.apple.Finder AppleShowAllFiles -bool true

echo ""
echo "Show Library folders"
sudo chflags nohidden /Library
chflags nohidden ~/Library

echo ""
echo "Show the /Volumes folder"
sudo chflags nohidden /Volumes

echo ""
echo "Show dotfiles in Finder by default"
defaults write com.apple.finder AppleShowAllFiles TRUE

echo ""
echo "Show all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo ""
echo "Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

echo ""
echo "Set ~/ as the default location for new Finder windows"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

echo ""
echo "Show tab view for new Finder windows"
defaults write com.apple.finder ShowTabView -bool true

echo ""
echo "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo ""
echo "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

echo ""
echo "Avoid creation of .DS_Store files on network volumes?"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo ""
echo "Show item info near icons on the desktop and in other icon views?"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

echo ""
echo "Enable AirDrop over Ethernet and on unsupported Macs running Lion"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

echo ""
echo "Misc. Finder Preferences"
defaults write com.apple.finder SidebarWidth -int 149

# echo ""
# echo "Sidebar icons"
# defaults write com.apple.??? "$(cat files/sidebar-icons.plist)"
