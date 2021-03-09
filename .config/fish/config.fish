function cl -d "cd into directory and ls"
  cd $argv
  ls
end
abbr -a l ls -lha
abbr -a reload source ~/.config/fish/config.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -x ANDROID_HOME "/Users/"(whoami)"/Library/Android/sdk"
set -x ANDROID_SDK_ROOT "/Users/"(whoami)"/Library/Android/sdk"

set PATH $PATH /usr/local/bin $HOME/.local/bin $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $HOME/Library/Developer/flutter/bin $HOME/.fastlane/bin $HOME/.gem/ruby/2.6.0/bin
set -g fish_user_paths "/usr/local/sbin" "/usr/local/opt/ruby/bin" $fish_user_paths

set -Ux EDITOR vim

#set -x fish_emoji_width 2
#set -x fish_ambiguous_width 2

