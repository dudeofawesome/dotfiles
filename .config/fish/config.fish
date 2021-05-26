function cl -d "cd into directory and ls"
  cd $argv
  ls
end
abbr -a l ls -lha
abbr -a lblk lsblk --output NAME,SIZE,RM,FSTYPE,UUID,MOUNTPOINT

abbr -a reload source ~/.config/fish/config.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -x ANDROID_HOME "/Users/"(whoami)"/Library/Android/sdk"
set -x ANDROID_SDK_ROOT "/Users/"(whoami)"/Library/Android/sdk"

fish_add_path /usr/local/bin
fish_add_path $HOME/.local/bin
fish_add_path $ANDROID_HOME/tools
fish_add_path $ANDROID_HOME/tools/bin
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $HOME/Library/Developer/flutter/bin
fish_add_path $HOME/.fastlane/bin
fish_add_path $HOME/.gem/ruby/2.6.0/bin
fish_add_path $HOME/go/bin

set -g fish_user_paths "/usr/local/sbin" "/usr/local/opt/ruby/bin" $fish_user_paths

set -Ux EDITOR vim

#set -x fish_emoji_width 2
#set -x fish_ambiguous_width 2

