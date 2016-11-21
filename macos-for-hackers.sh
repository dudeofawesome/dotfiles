#!/bin/sh

###
# SOME COMMANDS WILL NOT WORK ON macOS (Sierra or newer)
# For Sierra or newer, see https://github.com/mathiasbynens/dotfiles/blob/master/.macos
###

# Alot of these configs have been taken from the various places
# on the web, most from here
# https://github.com/mathiasbynens/dotfiles/blob/5b3c8418ed42d93af2e647dc9d122f25cc034871/.osx

# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

# Resets the style
reset=`tput sgr0`

# Color-echo. Improved. [Thanks @joaocunha]
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}

# Set continue to false by default
CONTINUE=false

echo ""
cecho "###############################################" $red
cecho "#        DO NOT RUN THIS SCRIPT BLINDLY       #" $red
cecho "#         YOU'LL PROBABLY REGRET IT...        #" $red
cecho "#                                             #" $red
cecho "#              READ IT THOROUGHLY             #" $red
cecho "#         AND EDIT TO SUIT YOUR NEEDS         #" $red
cecho "###############################################" $red
echo ""


echo ""
cecho "Have you read through the script you're about to run and " $red
cecho "understood that it will make changes to your computer? (y/n)" $yellow
tput bel
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" $red
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
# Copy dotfiles into place
###############################################################################

echo ""
echo "Copying dotfiles into place"
cp -ar .config/ ~/
cp -a .editorconfig ~/
cp -a .hyper.js ~/
cp -ar .iterm ~/
cp -a .vimrc ~/

###############################################################################
# Homebrew / Casks / Gems / Node Modules
###############################################################################

echo ""
echo "Installing Homebrew from http://brew.sh"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

echo ""
echo "Install GNU core utilities (those that come with macOS are outdated)."
echo "Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`."
brew install coreutils

echo ""
echo "Install some utilities"
brew install git
brew install wget
brew install nmap
brew install imagemagick --with-webp
brew install libyaml
brew install cmake

echo ""
echo "Install Node.JS"
brew install node
sudo npm install -g n
sudo n latest
sudo n lts

echo ""
echo "Install Foreman"
gem install foreman

echo ""
echo "Install Foreman"
gem install foreman

echo ""
echo "Install Ionic"
sudo npm install -g cordova
sudo npm install -g ionic
sudo npm install -g ios-sim

echo ""
echo "Install Yarn"
sudo npm install -g yarn

echo ""
echo "Install Typescript"
sudo npm install -g typescript tslint ts-node

echo ""
echo "Install StrongLoop"
sudo npm install -g strongloop apiconnect

echo ""
echo "Install Gulp and Grunt"
sudo npm install -g gulp grunt-cli

echo ""
echo "Install a few other utils"
sudo npm install -g http-server
sudo npm install -g sass-lint
sudo npm install -g jscs jshint
gem install scss_lint

echo ""
echo "Installing Fish Shell and setting it as the default shell"
brew install fish
echo "/usr/local/bin/fish" >> /etc/shells
chsh -s echo /usr/local/bin/fish

echo ""
echo "Installing Oh my Fish"
curl -L http://get.oh-my.fish | fish
fish -c "omf install osx"
fish -c "omf install node-binpath"
fish -c "omf install @dudeofawesome/fish-plugin-npm"
fish -c "omf install agnoster"

echo ""
echo "Installing ZSH"
brew install zsh
echo "/usr/local/bin/zsh" >> /etc/shells

echo ""
echo "Installing Certbot"
brew install certbot

echo ""
echo "Installing Vim"
brew install vim --override-system-vi
vim -c VundleUpdate -c quitall
pushd ~/.vim/bundle/YouCompleteMe
./install.py --tern-completer
cd ../vimproc.vim
make
popd

echo ""
echo "Installing Homebrew Cask"
brew tap caskroom/cask

echo ""
echo "Installing Google Chrome"
brew cask install google-chrome

echo ""
echo "Installing Firefox"
brew cask install firefox

echo ""
echo "Installing Opera"
brew cask install opera

echo ""
echo "Installing Skype"
brew cask install skype

echo ""
echo "Installing VSCode"
brew cask install visual-studio-code

echo ""
echo "Installing Atom"
brew cask install atom

echo ""
echo "Installing Sublime Text"
brew cask install sublime-text

echo ""
echo "Installing Dash"
brew cask install dash

echo ""
echo "Installing iTerm 2"
brew cask install iterm2

echo ""
echo "Installing Postico"
brew cask install postico

echo ""
echo "Installing Postman"
brew cask install postman

echo ""
echo "Installing Slack"
brew cask install slack

echo ""
echo "Installing Caprine"
brew cask install caprine

echo ""
echo "Installing Github Desktop"
brew cask install github-desktop

echo ""
echo "Installing Cyberduck"
brew cask install cyberduck

echo ""
echo "Installing MongoHub"
brew cask install jeromelebel-mongohub

echo ""
echo "Installing SequalPro"
brew cask install sequel-pro

echo ""
echo "Installing gitup"
brew cask install gitup

echo ""
echo "Installing Android File Transfer"
brew cask install android-file-transfer

echo ""
echo "Installing Android Studio"
brew cask install android-studio

echo ""
echo "Installing Android SDK"
brew install android-sdk

echo ""
echo "Installing Docker"
brew cask install docker

echo ""
echo "Installing Kitematic (Docker)"
brew cask install kitematic

echo ""
echo "Installing Blender"
brew cask install blender

echo ""
echo "Installing Sketchup"
brew cask install sketchup

echo ""
echo "Installing Sketch"
brew cask install sketch

echo ""
echo "Installing Sketch Toolbox"
brew cask install sketch-toolbox

echo ""
echo "Installing VLC"
brew cask install vlc

echo ""
echo "Installing BetterTouchTool"
brew cask install bettertouchtool

echo ""
echo "Installing Insync"
brew cask install insync

echo ""
echo "Installing Audacity"
brew cask install audacity

echo ""
echo "Installing Arduino"
brew cask install arduino

echo ""
echo "Installing The Unarchiver"
brew cask install the-unarchiver

echo ""
echo "Installing Flux"
brew cask install flux

echo ""
echo "Installing Handbrake"
brew cask install handbrake

echo ""
echo "Installing Unified Remote"
brew cask install unified-remote

echo ""
echo "Installing SuperDuper!"
brew cask install superduper

echo ""
echo "Installing Übersicht"
brew cask install ubersicht

echo ""
echo "Installing Transmission"
brew cask install transmission

echo ""
echo "Installing Xbench"
brew cask install xbench

echo ""
echo "Installing Spotify"
brew cask install spotify

echo ""
echo "Installing QuickLook extensions"
brew cask install qlcolorcode
brew cask install betterzipql
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install qlvideo

echo ""
echo "Installing fonts"
brew tap caskroom/fonts
brew cask install font-fira-code
brew cask install font-roboto
brew cask install font-roboto-mono-for-powerline

###############################################################################
# General UI/UX
###############################################################################

echo ""
cecho "Would you like to set your computer name (as done via System Preferences >> Sharing)? (y/n)" $yellow
tput bel
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "What would you like it to be?"
  read COMPUTER_NAME
  sudo scutil --set ComputerName $COMPUTER_NAME
  sudo scutil --set HostName $COMPUTER_NAME
  sudo scutil --set LocalHostName $COMPUTER_NAME
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME
fi

echo ""
cecho "Change indexing order and disable some search results in Spotlight? (y/n)" $yellow
tput bel
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  # Yosemite-specific search results (remove them if your are using OS X 10.9 or older):
  #   MENU_DEFINITION
  #   MENU_CONVERSION
  #   MENU_EXPRESSION
  #   MENU_SPOTLIGHT_SUGGESTIONS (send search queries to Apple)
  #   MENU_WEBSEARCH             (send search queries to Apple)
  #   MENU_OTHER
  defaults write com.apple.spotlight orderedItems -array \
    '{"enabled" = 1;"name" = "APPLICATIONS";}' \
    '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
    '{"enabled" = 1;"name" = "DIRECTORIES";}' \
    '{"enabled" = 1;"name" = "PDF";}' \
    '{"enabled" = 1;"name" = "FONTS";}' \
    '{"enabled" = 1;"name" = "DOCUMENTS";}' \
    '{"enabled" = 1;"name" = "MESSAGES";}' \
    '{"enabled" = 1;"name" = "CONTACT";}' \
    '{"enabled" = 1;"name" = "EVENT_TODO";}' \
    '{"enabled" = 1;"name" = "IMAGES";}' \
    '{"enabled" = 1;"name" = "BOOKMARKS";}' \
    '{"enabled" = 1;"name" = "MUSIC";}' \
    '{"enabled" = 1;"name" = "MOVIES";}' \
    '{"enabled" = 1;"name" = "PRESENTATIONS";}' \
    '{"enabled" = 1;"name" = "SPREADSHEETS";}' \
    '{"enabled" = 1;"name" = "SOURCE";}' \
    '{"enabled" = 1;"name" = "MENU_DEFINITION";}' \
    '{"enabled" = 1;"name" = "MENU_OTHER";}' \
    '{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
    '{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
    '{"enabled" = 1;"name" = "MENU_WEBSEARCH";}' \
    '{"enabled" = 1;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'
  # Load new settings before rebuilding the index
  killall mds > /dev/null 2>&1
  # Make sure indexing is enabled for the main volume
  sudo mdutil -i on / > /dev/null
  # Rebuild the index from scratch
  sudo mdutil -E / > /dev/null
fi

echo ""
echo "Enable the sound effects on boot"
sudo nvram BootAudio=%01

echo ""
echo "Increase window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo ""
echo "Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo ""
echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo ""
echo "Save to disk, rather than iCloud, by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo ""
echo "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

echo ""
cecho "Check for software updates daily, not just once per week? (y/n)" $yellow
tput bel
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
fi

echo ""
echo "Removing duplicates in the 'Open With' menu"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

echo ""
echo "Add ability to toggle between Light and Dark mode in Yosemite using ctrl+opt+cmd+t"
# http://www.reddit.com/r/apple/comments/2jr6s2/1010_i_found_a_way_to_dynamically_switch_between/
sudo defaults write /Library/Preferences/.GlobalPreferences.plist _HIEnableThemeSwitchHotKey -bool true

echo ""
echo "Disable Photos.app from starting everytime a device is plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# General Power and Performance modifications
###############################################################################

echo ""
cecho "Disable hibernation? (speeds up entering sleep mode) (y/n)" $yellow
tput bel
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  sudo pmset -a hibernatemode 0
fi

################################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input
###############################################################################

echo ""
echo "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo ""
echo "Enabling full keyboard access for all controls (enable Tab in modal dialogs, menu windows, etc.)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo ""
echo "Setting a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

echo ""
echo "Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

echo ""
echo "Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

echo ""
echo "Enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

###############################################################################
# Screen
###############################################################################

echo ""
echo "Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo ""
echo "Enabling HiDPI display modes (requires restart)"
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
# Finder
###############################################################################

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

###############################################################################
# Dock & Mission Control
###############################################################################

echo "Wipe all (default) app icons from the Dock and add a different set? (y/n)" $yellow
tput bel
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  defaults write com.apple.dock persistent-apps -array "$(cat <<EOM
(
        {
        GUID = 1585529326;
        "tile-data" =         {
            book = <626f6f6b e4020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 04020000 0c000000 01010000 4170706c 69636174 696f6e73 11000000 01010000 476f6f67 6c652043 68726f6d 652e6170 70000000 08000000 01060000 04000000 18000000 08000000 04030000 48000000 00000000 08000000 04030000 24890700 00000000 08000000 01060000 44000000 54000000 08000000 00040000 41bd7651 e8000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0d000000 01010000 4d616369 6e746f73 68205353 44000000 08000000 04030000 0080e608 77000000 08000000 00040000 41bd7bb4 5c000000 24000000 01010000 35394238 44323742 2d323132 302d3345 31322d38 3037452d 43303435 37443939 32373538 18000000 01020000 81010000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 b0000000 01020000 34333730 30626361 33343439 62333435 36653937 31623630 37303561 36376637 64313463 38623066 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b303030 30303030 313b3031 30303030 31323b30 30303030 30303030 30303738 3932343b 2f617070 6c696361 74696f6e 732f676f 6f676c65 20636872 6f6d652e 61707000 a8000000 feffffff 01000000 00000000 0d000000 04100000 34000000 00000000 05100000 64000000 00000000 10100000 84000000 00000000 40100000 74000000 00000000 02200000 38010000 00000000 05200000 a4000000 00000000 10200000 b4000000 00000000 11200000 ec000000 00000000 12200000 cc000000 00000000 13200000 dc000000 00000000 20200000 18010000 00000000 30200000 44010000 00000000 80f00000 4c010000 00000000>;
            "bundle-identifier" = "com.google.Chrome";
            "dock-extra" = 0;
            "file-data" =             {
                "_CFURLString" = "file:///Applications/Google%20Chrome.app/";
                "_CFURLStringType" = 15;
            };
            "file-label" = "Google Chrome";
            "file-mod-date" = 3557618461;
            "file-type" = 41;
            "parent-mod-date" = 3558754522;
        };
        "tile-type" = "file-tile";
    },
        {
        GUID = 1644535571;
        "tile-data" =         {
            book = <626f6f6b d8020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 f8010000 0c000000 01010000 4170706c 69636174 696f6e73 0b000000 01010000 43617072 696e652e 61707000 08000000 01060000 04000000 18000000 08000000 04030000 48000000 00000000 08000000 04030000 50aa8500 00000000 08000000 01060000 3c000000 4c000000 08000000 00040000 41bdcbe5 6c000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0d000000 01010000 4d616369 6e746f73 68205353 44000000 08000000 04030000 0080e608 77000000 08000000 00040000 41bd7bb4 5c000000 24000000 01010000 35394238 44323742 2d323132 302d3345 31322d38 3037452d 43303435 37443939 32373538 18000000 01020000 81010000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 aa000000 01020000 66313765 65323633 35333035 32633737 35303764 33633837 39306163 33323164 34336438 34326137 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b303030 30303030 313b3031 30303030 31313b30 30303030 30303030 30383561 6135303b 2f617070 6c696361 74696f6e 732f6361 7072696e 652e6170 70000000 a8000000 feffffff 01000000 00000000 0d000000 04100000 2c000000 00000000 05100000 5c000000 00000000 10100000 7c000000 00000000 40100000 6c000000 00000000 02200000 30010000 00000000 05200000 9c000000 00000000 10200000 ac000000 00000000 11200000 e4000000 00000000 12200000 c4000000 00000000 13200000 d4000000 00000000 20200000 10010000 00000000 30200000 3c010000 00000000 80f00000 44010000 00000000>;
            "bundle-identifier" = "com.sindresorhus.caprine";
            "dock-extra" = 0;
            "file-data" =             {
                "_CFURLString" = "file:///Applications/Caprine.app/";
                "_CFURLStringType" = 15;
            };
            "file-label" = Caprine;
            "file-mod-date" = 3561053804;
            "file-type" = 41;
            "parent-mod-date" = 3562010920;
        };
        "tile-type" = "file-tile";
    },
        {
        GUID = 2458129515;
        "tile-data" =         {
            book = <626f6f6b d4020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 f4010000 0c000000 01010000 4170706c 69636174 696f6e73 09000000 01010000 536c6163 6b2e6170 70000000 08000000 01060000 04000000 18000000 08000000 04030000 48000000 00000000 08000000 04030000 32d86700 00000000 08000000 01060000 3c000000 4c000000 08000000 00040000 41bdc019 06000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0d000000 01010000 4d616369 6e746f73 68205353 44000000 08000000 04030000 0080e608 77000000 08000000 00040000 41bd7bb4 5c000000 24000000 01010000 35394238 44323742 2d323132 302d3345 31322d38 3037452d 43303435 37443939 32373538 18000000 01020000 81010000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 a8000000 01020000 39363431 38313534 36656436 31333262 66396530 61303331 35373936 34653333 31653338 38653737 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b303030 30303030 313b3031 30303030 31313b30 30303030 30303030 30363764 3833323b 2f617070 6c696361 74696f6e 732f736c 61636b2e 61707000 a8000000 feffffff 01000000 00000000 0d000000 04100000 2c000000 00000000 05100000 5c000000 00000000 10100000 7c000000 00000000 40100000 6c000000 00000000 02200000 30010000 00000000 05200000 9c000000 00000000 10200000 ac000000 00000000 11200000 e4000000 00000000 12200000 c4000000 00000000 13200000 d4000000 00000000 20200000 10010000 00000000 30200000 3c010000 00000000 80f00000 44010000 00000000>;
            "bundle-identifier" = "com.tinyspeck.slackmacgap";
            "dock-extra" = 0;
            "file-data" =             {
                "_CFURLString" = "file:///Applications/Slack.app/";
                "_CFURLStringType" = 15;
            };
            "file-label" = Slack;
            "file-mod-date" = 3560484348;
            "file-type" = 41;
            "parent-mod-date" = 3562010920;
        };
        "tile-type" = "file-tile";
    },
        {
        GUID = 11088862;
        "tile-data" =         {
            book = <626f6f6b d8020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 f8010000 0c000000 01010000 4170706c 69636174 696f6e73 0c000000 01010000 43616c65 6e646172 2e617070 08000000 01060000 04000000 18000000 08000000 04030000 48000000 00000000 08000000 04030000 48090000 00000000 08000000 01060000 3c000000 4c000000 08000000 00040000 41bc588d b4000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0d000000 01010000 4d616369 6e746f73 68205353 44000000 08000000 04030000 0080e608 77000000 08000000 00040000 41bd7bb4 5c000000 24000000 01010000 35394238 44323742 2d323132 302d3345 31322d38 3037452d 43303435 37443939 32373538 18000000 01020000 81010000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 ab000000 01020000 63303136 31393332 32373731 32663938 36663266 64303565 66646262 62623039 37333433 33336134 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b303030 30303030 313b3031 30303030 31323b30 30303030 30303030 30303030 3934383b 2f617070 6c696361 74696f6e 732f6361 6c656e64 61722e61 70700000 a8000000 feffffff 01000000 00000000 0d000000 04100000 2c000000 00000000 05100000 5c000000 00000000 10100000 7c000000 00000000 40100000 6c000000 00000000 02200000 30010000 00000000 05200000 9c000000 00000000 10200000 ac000000 00000000 11200000 e4000000 00000000 12200000 c4000000 00000000 13200000 d4000000 00000000 20200000 10010000 00000000 30200000 3c010000 00000000 80f00000 44010000 00000000>;
            "bundle-identifier" = "com.apple.iCal";
            "dock-extra" = 1;
            "file-data" =             {
                "_CFURLString" = "file:///Applications/Calendar.app/";
                "_CFURLStringType" = 15;
            };
            "file-label" = Calendar;
            "file-mod-date" = 3536717492;
            "file-type" = 41;
            "parent-mod-date" = 3561331206;
        };
        "tile-type" = "file-tile";
    },
        {
        GUID = 1172194518;
        "tile-data" =         {
            book = <626f6f6b f0020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 10020000 0c000000 01010000 4170706c 69636174 696f6e73 16000000 01010000 56697375 616c2053 74756469 6f20436f 64652e61 70700000 08000000 01060000 04000000 18000000 08000000 04030000 48000000 00000000 08000000 04030000 10897a00 00000000 08000000 01060000 48000000 58000000 08000000 00040000 41bdb897 f4000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0d000000 01010000 4d616369 6e746f73 68205353 44000000 08000000 04030000 0080e608 77000000 08000000 00040000 41bd7bb4 5c000000 24000000 01010000 35394238 44323742 2d323132 302d3345 31322d38 3037452d 43303435 37443939 32373538 18000000 01020000 81010000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 b5000000 01020000 63663065 66316234 65336635 64333239 38633365 37353130 62376237 66636130 63343362 61393261 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b303030 30303030 313b3031 30303030 31313b30 30303030 30303030 30376138 3931303b 2f617070 6c696361 74696f6e 732f7669 7375616c 20737475 64696f20 636f6465 2e617070 00000000 a8000000 feffffff 01000000 00000000 0d000000 04100000 38000000 00000000 05100000 68000000 00000000 10100000 88000000 00000000 40100000 78000000 00000000 02200000 3c010000 00000000 05200000 a8000000 00000000 10200000 b8000000 00000000 11200000 f0000000 00000000 12200000 d0000000 00000000 13200000 e0000000 00000000 20200000 1c010000 00000000 30200000 48010000 00000000 80f00000 50010000 00000000>;
            "bundle-identifier" = "com.microsoft.VSCode";
            "dock-extra" = 0;
            "file-data" =             {
                "_CFURLString" = "file:///Applications/Visual%20Studio%20Code.app/";
                "_CFURLStringType" = 15;
            };
            "file-label" = "Visual Studio Code";
            "file-mod-date" = 3559788788;
            "file-type" = 41;
            "parent-mod-date" = 3562010920;
        };
        "tile-type" = "file-tile";
    },
        {
        GUID = 1981353353;
        "tile-data" =         {
            book = <626f6f6b d4020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 f4010000 0c000000 01010000 4170706c 69636174 696f6e73 09000000 01010000 69546572 6d2e6170 70000000 08000000 01060000 04000000 18000000 08000000 04030000 48000000 00000000 08000000 04030000 d9576400 00000000 08000000 01060000 3c000000 4c000000 08000000 00040000 41bda22c 42000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0d000000 01010000 4d616369 6e746f73 68205353 44000000 08000000 04030000 0080e608 77000000 08000000 00040000 41bd7bb4 5c000000 24000000 01010000 35394238 44323742 2d323132 302d3345 31322d38 3037452d 43303435 37443939 32373538 18000000 01020000 81010000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 a8000000 01020000 64616636 39636234 39326464 66623833 39316630 32636364 38326633 62623432 33323538 39653033 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b303030 30303030 313b3031 30303030 31313b30 30303030 30303030 30363435 3764393b 2f617070 6c696361 74696f6e 732f6974 65726d2e 61707000 a8000000 feffffff 01000000 00000000 0d000000 04100000 2c000000 00000000 05100000 5c000000 00000000 10100000 7c000000 00000000 40100000 6c000000 00000000 02200000 30010000 00000000 05200000 9c000000 00000000 10200000 ac000000 00000000 11200000 e4000000 00000000 12200000 c4000000 00000000 13200000 d4000000 00000000 20200000 10010000 00000000 30200000 3c010000 00000000 80f00000 44010000 00000000>;
            "bundle-identifier" = "com.googlecode.iterm2";
            "dock-extra" = 0;
            "file-data" =             {
                "_CFURLString" = "file:///Applications/iTerm.app/";
                "_CFURLStringType" = 15;
            };
            "file-label" = iTerm;
            "file-mod-date" = 3560883128;
            "file-type" = 41;
            "parent-mod-date" = 3562010920;
        };
        "tile-type" = "file-tile";
    },
        {
        GUID = 478365954;
        "tile-data" =         {
            book = <626f6f6b e8020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 08020000 0c000000 01010000 4170706c 69636174 696f6e73 12000000 01010000 47697448 75622044 65736b74 6f702e61 70700000 08000000 01060000 04000000 18000000 08000000 04030000 48000000 00000000 08000000 04030000 7a543400 00000000 08000000 01060000 44000000 54000000 08000000 00040000 41bd9411 07000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0d000000 01010000 4d616369 6e746f73 68205353 44000000 08000000 04030000 0080e608 77000000 08000000 00040000 41bd7bb4 5c000000 24000000 01010000 35394238 44323742 2d323132 302d3345 31322d38 3037452d 43303435 37443939 32373538 18000000 01020000 81010000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 b1000000 01020000 36646161 32353866 31623038 66313931 33653763 34393733 62306565 30326435 65336439 65316333 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b303030 30303030 313b3031 30303030 31313b30 30303030 30303030 30333435 3437613b 2f617070 6c696361 74696f6e 732f6769 74687562 20646573 6b746f70 2e617070 00000000 a8000000 feffffff 01000000 00000000 0d000000 04100000 34000000 00000000 05100000 64000000 00000000 10100000 84000000 00000000 40100000 74000000 00000000 02200000 38010000 00000000 05200000 a4000000 00000000 10200000 b4000000 00000000 11200000 ec000000 00000000 12200000 cc000000 00000000 13200000 dc000000 00000000 20200000 18010000 00000000 30200000 44010000 00000000 80f00000 4c010000 00000000>;
            "bundle-identifier" = "com.github.GitHub";
            "dock-extra" = 0;
            "file-data" =             {
                "_CFURLString" = "file:///Applications/GitHub%20Desktop.app/";
                "_CFURLStringType" = 15;
            };
            "file-label" = "GitHub Desktop";
            "file-mod-date" = 3557394951;
            "file-type" = 41;
            "parent-mod-date" = 3562010920;
        };
        "tile-type" = "file-tile";
    },
        {
        GUID = 11088872;
        "tile-data" =         {
            book = <626f6f6b f0020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 10020000 0c000000 01010000 4170706c 69636174 696f6e73 16000000 01010000 53797374 656d2050 72656665 72656e63 65732e61 70700000 08000000 01060000 04000000 18000000 08000000 04030000 48000000 00000000 08000000 04030000 8ea80000 00000000 08000000 01060000 48000000 58000000 08000000 00040000 41bbdf31 2f000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0d000000 01010000 4d616369 6e746f73 68205353 44000000 08000000 04030000 0080e608 77000000 08000000 00040000 41bd7bb4 5c000000 24000000 01010000 35394238 44323742 2d323132 302d3345 31322d38 3037452d 43303435 37443939 32373538 18000000 01020000 81010000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 b5000000 01020000 65633965 32356164 31313933 62616431 35633662 66326463 37336265 36646663 65323830 31666665 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b303030 30303030 313b3031 30303030 31323b30 30303030 30303030 30303061 3838653b 2f617070 6c696361 74696f6e 732f7379 7374656d 20707265 66657265 6e636573 2e617070 00000000 a8000000 feffffff 01000000 00000000 0d000000 04100000 38000000 00000000 05100000 68000000 00000000 10100000 88000000 00000000 40100000 78000000 00000000 02200000 3c010000 00000000 05200000 a8000000 00000000 10200000 b8000000 00000000 11200000 f0000000 00000000 12200000 d0000000 00000000 13200000 e0000000 00000000 20200000 1c010000 00000000 30200000 48010000 00000000 80f00000 50010000 00000000>;
            "bundle-identifier" = "com.apple.systempreferences";
            "dock-extra" = 1;
            "file-data" =             {
                "_CFURLString" = "file:///Applications/System%20Preferences.app/";
                "_CFURLStringType" = 15;
            };
            "file-label" = "System Preferences";
            "file-mod-date" = 3528763951;
            "file-type" = 41;
            "parent-mod-date" = 3561678779;
        };
        "tile-type" = "file-tile";
    }
)
EOM
)"
  defaults write com.apple.dock persistent-others -array "$(cat <<EOM
(
        {
        GUID = 1981353352;
        "tile-data" =         {
            arrangement = 1;
            book = <626f6f6b ac020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 c0010000 0c000000 01010000 4170706c 69636174 696f6e73 04000000 01060000 04000000 08000000 04030000 48000000 00000000 04000000 01060000 24000000 08000000 00040000 41bd30a0 0e000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 00000000 01050000 08000000 01090000 66696c65 3a2f2f2f 0d000000 01010000 4d616369 6e746f73 68205353 44000000 08000000 04030000 0080e608 77000000 08000000 00040000 41bd7bb4 5c000000 24000000 01010000 35394238 44323742 2d323132 302d3345 31322d38 3037452d 43303435 37443939 32373538 18000000 01020000 81010000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 9e000000 01020000 39336231 65303738 32323736 35663837 36303062 30343764 30393565 61383136 36643033 66333230 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b303030 30303030 313b3031 30303030 31313b30 30303030 30303030 30303030 3034383b 2f617070 6c696361 74696f6e 73000000 b4000000 feffffff 01000000 00000000 0e000000 04100000 18000000 00000000 05100000 34000000 00000000 10100000 50000000 00000000 40100000 40000000 00000000 02200000 0c010000 00000000 05200000 78000000 00000000 10200000 88000000 00000000 11200000 c0000000 00000000 12200000 a0000000 00000000 13200000 b0000000 00000000 20200000 ec000000 00000000 30200000 70000000 00000000 01d00000 70000000 00000000 80f00000 18010000 00000000>;
            displayas = 1;
            "file-data" =             {
                "_CFURLString" = "file:///Applications/";
                "_CFURLStringType" = 15;
            };
            "file-label" = Applications;
            "file-mod-date" = 3555822314;
            "file-type" = 2;
            "parent-mod-date" = 3555821650;
            preferreditemsize = "-1";
            showas = 2;
        };
        "tile-type" = "directory-tile";
    },
        {
        GUID = 11088873;
        "tile-data" =         {
            arrangement = 2;
            book = <626f6f6b 48030000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 44020000 05000000 01010000 55736572 73000000 0d000000 01010000 44756465 4f664177 65736f6d 65000000 09000000 01010000 446f776e 6c6f6164 73000000 0c000000 01060000 04000000 14000000 2c000000 08000000 04030000 53300600 00000000 08000000 04030000 da870600 00000000 08000000 04030000 dd870600 00000000 0c000000 01060000 54000000 64000000 74000000 08000000 00040000 41bb4ddc a5000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 04030000 01000000 00000000 04000000 03030000 f5010000 08000000 01090000 66696c65 3a2f2f2f 0d000000 01010000 4d616369 6e746f73 68205353 44000000 08000000 04030000 0080e608 77000000 08000000 00040000 41bd7bb4 5c000000 24000000 01010000 35394238 44323742 2d323132 302d3345 31322d38 3037452d 43303435 37443939 32373538 18000000 01020000 81010000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 af000000 01020000 66323131 30663634 64383734 64333339 63353230 65653665 32636664 34616464 65663439 62663862 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b303030 30303030 313b3031 30303030 31313b30 30303030 30303030 30303638 3764643b 2f757365 72732f64 7564656f 66617765 736f6d65 2f646f77 6e6c6f61 64730000 cc000000 feffffff 01000000 00000000 10000000 04100000 40000000 00000000 05100000 84000000 00000000 10100000 a8000000 00000000 40100000 98000000 00000000 02200000 78010000 00000000 05200000 e4000000 00000000 10200000 f4000000 00000000 11200000 2c010000 00000000 12200000 0c010000 00000000 13200000 1c010000 00000000 20200000 58010000 00000000 30200000 84010000 00000000 01c00000 c8000000 00000000 11c00000 14000000 00000000 12c00000 d8000000 00000000 80f00000 8c010000 00000000>;
            displayas = 0;
            "file-data" =             {
                "_CFURLString" = "file:///Users/DudeOfAwesome/Downloads/";
                "_CFURLStringType" = 15;
            };
            "file-label" = Downloads;
            "file-mod-date" = 3555799618;
            "file-type" = 2;
            "parent-mod-date" = 3555799773;
            preferreditemsize = "-1";
            showas = 1;
        };
        "tile-type" = "directory-tile";
    }
)
EOM
)"
fi


echo ""
echo "Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 28

echo ""
echo "Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool false

echo ""
echo "Remove the auto-hiding delay from Dock"
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

echo ""
echo "Minimize windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true

echo ""
echo "Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true
defaults write com.apple.dock dashboard-in-overlay -bool true

echo ""
echo "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

echo ""
echo "Add iOS Simulator & FileMerge to Launchpad"
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
sudo ln -sf "/Applications/Xcode.app/Contents/Applications/FileMerge.app" "/Applications/FileMerge.app"

echo ""
echo "Hot corners"
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner → Desktop
defaults write com.apple.dock wvous-tl-corner -int 4
defaults write com.apple.dock wvous-tl-modifier -int 0

###############################################################################
# Chrome, Safari, & WebKit
###############################################################################

echo ""
echo "Privacy: Don't send search queries to Apple"
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

echo ""
echo "Hiding Safari's bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

echo ""
echo "Disabling Safari's thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo ""
echo "Making Safari's search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo ""
echo "Removing useless icons from Safari's bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

echo ""
echo "Update extensions automatically"
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

echo ""
echo "Enabling Safari's debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo ""
echo "Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

echo ""
echo "Adding a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

###############################################################################
# Mail
###############################################################################

echo ""
echo "Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

echo ""
echo "Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app"
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

###############################################################################
# Terminal
###############################################################################

echo ""
echo "Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

###############################################################################
# Time Machine
###############################################################################

echo ""
echo "Prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

###############################################################################
# Transmission.app                                                            #
###############################################################################

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

###############################################################################
# Git
###############################################################################

echo ""
echo "Setting Git user"
git config --global user.name "Louis Orleans"
git config --global user.email "louis@orleans.io"

echo ""
echo "Setting Git to use VSCode as default editor"
git config --global core.editor "code -n -w"

# Create a nice last-change git log message, from https://twitter.com/elijahmanor/status/697055097356943360
git config --global alias.lastchange 'log -p --follow -n 1'

###############################################################################
# Kill affected applications
###############################################################################

echo ""
cecho "Done!" $cyan
echo ""
echo ""
cecho "################################################################################" $white
echo ""
echo ""
cecho "Note that some of these changes require a logout/restart to take effect." $red
cecho "Press enter when you are ready" $yellow
tput bel
read
cecho "Killing some open applications in order to take effect." $red
echo ""

find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
  "Terminal" "Transmission"; do
  killall "${app}" > /dev/null 2>&1
done
