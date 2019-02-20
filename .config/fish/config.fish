function cl -d "cd into directory and ls"
  cd $argv
  ls
end
abbr -a l ls -la
abbr -a reload source ~/.config/fish/config.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -x ANDROID_HOME "/Users/"(whoami)"/Library/Android/sdk"
set -x ANDROID_SDK_ROOT "/Users/"(whoami)"/Library/Android/sdk"

set PATH $PATH $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $HOME/Library/Developer/flutter/bin $HOME/.fastlane/bin

set -Ux EDITOR vim

