# wipe previous abbreviations, since we're recreating them here
abbr --erase (abbr --list)

source ~/.config/fish/tide.config.fish

abbr -a reload source ~/.config/fish/config.fish

abbr -a l ls -lha
abbr -a lblk lsblk --output NAME,SIZE,RM,FSTYPE,FSUSE%,SERIAL,MOUNTPOINT

# load shell integrations
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
if type -q code
  string match -q "$TERM_PROGRAM" "vscode" and . (code --locate-shell-integration-path fish)
end

set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
set -Ux EDITOR vim

fish_add_path /usr/local/bin
fish_add_path /usr/local/sbin
fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/opt/avr-gcc@8/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/Library/Developer/flutter/bin
fish_add_path $HOME/.fastlane/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $ANDROID_HOME/tools
fish_add_path $ANDROID_HOME/tools/bin
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin

# `nvm use` if .nvmrc is present on shell launch
if test -f .nvmrc || test -f .node-version
  echo (nvm use)
end

set -x FVM_HOME "$HOME/.local/share/fvm"
# use FVM if .fvm is present
if test -f .fvm/flutter_sdk/bin/flutter
  echo Using FVM (fvm --version)
  function flutter
    echo "Using .fvm …"
    fvm flutter $argv
  end
end

if type -q kubectl
  abbr -a k kubectl
end
