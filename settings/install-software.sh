#!/bin/bash

source "../libs.sh"

echo "###############################################################################"
echo "# Homebrew / Casks / Gems / Node Modules"
echo "###############################################################################"

echo ""
echo "Installing Homebrew from http://brew.sh 🍺"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null > /dev/null
brew update > /dev/null
brew upgrade > /dev/null

echo ""
echo "Install GNU core utilities (those that come with macOS are outdated)."
echo "Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`."
brew install coreutils > /dev/null

echo ""
echo "Install some utilities (this could take a while)"
brew install git > /dev/null
brew install git-flow > /dev/null
brew install hub > /dev/null
brew install wget > /dev/null
brew install nmap > /dev/null
brew install imagemagick --with-webp > /dev/null
brew install libyaml > /dev/null
brew install cmake > /dev/null
brew install less > /dev/null
brew install most > /dev/null

echo ""
printf "Install Node.JS ${green}⬢${reset}\n"
brew install node > /dev/null
sudo npm install -g n
sudo n latest > /dev/null
sudo n lts > /dev/null

echo ""
echo "Install Yarn 🐈"
brew install yarn > /dev/null

echo ""
echo "Install Foreman"
sudo gem install foreman > /dev/null

echo ""
echo "Install Travis CLI"
sudo gem install travis > /dev/null

echo ""
echo "Install ios-sim for Ionic"
sudo npm install -g ios-sim -s > /dev/null

echo ""
echo "Install Typescript"
sudo npm install -g typescript tslint ts-node -s > /dev/null

echo ""
echo "Install Gulp and Grunt"
sudo npm install -g gulp grunt-cli -s > /dev/null

echo ""
echo "Install a few other utils"
sudo npm install -g http-server -s > /dev/null
sudo npm install -g sass-lint -s > /dev/null
sudo npm install -g jscs jshint -s > /dev/null
sudo npm install -g copy-github-labels-cli -s > /dev/null
sudo gem install scss_lint > /dev/null

echo ""
echo "Installing Fish Shell and setting it as the default shell 🐟"
brew install fish > /dev/null
sudo sh -c 'echo "/usr/local/bin/fish" >> /etc/shells'
chsh -s /usr/local/bin/fish

echo ""
echo "Installing Oh my Fish (and a few plugins) 🐟"
tput bel
cd ~/Downloads
curl -L http://get.oh-my.fish > install-fish
chmod +x install-fish
./install-fish -y --noninteractive
fish -c "omf install osx"
fish -c "omf install node-binpath"
fish -c "omf install https://github.com/dudeofawesome/omf-plugin-yarn"
fish -c "omf install agnoster"
cd ~

echo ""
echo "Installing Certbot 🤖"
brew install certbot > /dev/null

echo ""
echo "Installing MAS (Mac App Store CLI)"
brew install mas > /dev/null

echo ""
echo "Installing Xcode (via mas CLI, you may need to sign in)"
tput bel
mas install 497799835

echo ""
echo "Installing Server (via mas CLI, you may need to sign in) 🌎"
tput bel
mas install 883878097

echo ""
echo "Installing Boxy (via mas CLI, you may need to sign in) 📬"
tput bel
mas install 1053031090

echo ""
echo "Installing Vim"
brew install vim --override-system-vi > /dev/null
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
tput bel
vim -c VundleUpdate -c quitall
pushd ~/.vim/bundle/YouCompleteMe
./install.py --tern-completer
cd ../vimproc.vim
make
popd

echo ""
echo "Installing Postgres 🐘"
brew install postgres > /dev/null

echo ""
echo "Installing FFMpeg"
brew install ffmpeg > /dev/null

echo ""
echo "Installing Gifsicle"
brew install gifsicle > /dev/null

echo ""
echo "Installing Homebrew Cask 🍺"
brew tap caskroom/cask > /dev/null

echo ""
echo "Installing Google Chrome"
brew cask install google-chrome > /dev/null

echo ""
echo "Installing Firefox"
brew cask install firefox > /dev/null

echo ""
echo "Installing Opera"
brew cask install opera > /dev/null

echo ""
echo "Installing Skype"
brew cask install skype > /dev/null

echo ""
echo "Installing VSCode"
brew cask install visual-studio-code > /dev/null

echo ""
echo "Installing Sublime Text"
brew cask install sublime-text > /dev/null

echo ""
echo "Installing Dash"
brew cask install dash > /dev/null

echo ""
echo "Installing iTerm 2"
brew cask install iterm2 > /dev/null

echo ""
echo "Installing Postico 🐘"
brew cask install postico > /dev/null

echo ""
echo "Installing Postman 📮"
brew cask install postman > /dev/null

echo ""
echo "Installing Slack"
brew cask install slack > /dev/null

echo ""
echo "Installing Caprine"
brew cask install caprine > /dev/null

echo ""
echo "Installing Github Desktop"
brew cask install github-desktop > /dev/null

echo ""
echo "Installing Cyberduck 🦆"
brew cask install cyberduck > /dev/null

echo ""
echo "Installing MongoHub"
brew cask install jeromelebel-mongohub > /dev/null

echo ""
echo "Installing SequalPro"
brew cask install sequel-pro > /dev/null

echo ""
echo "Installing GitUp"
brew cask install gitup > /dev/null

echo ""
echo "Installing Android File Transfer"
brew cask install android-file-transfer > /dev/null

echo ""
echo "Installing Android Studio"
brew cask install android-studio > /dev/null

echo ""
echo "Installing Android SDK"
brew install android-sdk > /dev/null

echo ""
echo "Installing Docker 🐳"
brew cask install docker > /dev/null

echo ""
echo "Installing Kitematic (Docker) 🐳"
brew cask install kitematic > /dev/null

echo ""
echo "Installing Private Internet Access"
brew cask install private-internet-access > /dev/null
sudo /usr/local/Caskroom/private-internet-access/latest/Private Internet Access Installer.app/Contents/MacOS/runner.sh

echo ""
echo "Installing Blender"
brew cask install blender > /dev/null

echo ""
echo "Installing Sketchup"
brew cask install sketchup > /dev/null

echo ""
echo "Installing Sketch ✏️"
brew cask install sketch > /dev/null

echo ""
echo "Installing Sketch Toolbox"
brew cask install sketch-toolbox > /dev/null

echo ""
echo "Installing VLC ▶️"
brew cask install vlc > /dev/null

echo ""
echo "Installing BetterTouchTool"
brew cask install bettertouchtool > /dev/null

echo ""
echo "Installing Insync"
brew cask install insync > /dev/null

echo ""
echo "Installing Audacity 🎹"
brew cask install audacity > /dev/null

echo ""
echo "Installing Arduino"
brew cask install arduino > /dev/null

echo ""
echo "Installing The Unarchiver"
brew cask install the-unarchiver > /dev/null

echo ""
echo "Installing Flux ☀️"
brew cask install flux > /dev/null

echo ""
echo "Installing Handbrake 📼"
brew cask install handbrake > /dev/null

echo ""
echo "Installing Unified Remote"
brew cask install unified-remote > /dev/null

echo ""
echo "Installing SuperDuper! 💾"
brew cask install superduper > /dev/null

echo ""
echo "Installing Übersicht"
brew cask install ubersicht > /dev/null

echo ""
echo "Installing TunnelBlick"
brew cask install tunnelblick > /dev/null

echo ""
echo "Installing Transmission"
brew cask install transmission > /dev/null

echo ""
echo "Installing Xbench"
brew cask install xbench > /dev/null

echo ""
echo "Installing Spotify 🎵"
brew cask install spotify > /dev/null

echo ""
echo "Installing QuickLook extensions 👁‍🗨"
brew cask install qlcolorcode > /dev/null
brew cask install betterzipql > /dev/null
brew cask install qlmarkdown > /dev/null
brew cask install qlstephen > /dev/null
brew cask install qlvideo > /dev/null
brew cask install quicklookapk > /dev/null

echo ""
echo "Installing 𝑓o𝑛𝑡𝑠"
brew tap caskroom/fonts > /dev/null
brew cask install font-fira-code > /dev/null
brew cask install font-roboto > /dev/null
brew cask install font-roboto-mono-for-powerline > /dev/null
