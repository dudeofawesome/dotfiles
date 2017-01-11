abbr -a up cd ..
abbr -a back cd -
abbr -a l ls -la
function cl -d "cd into directory and ls"
  cd $argv
  ls
end
abbr -a reload source ~/.config/fish/config.fish

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -x ANDROID_HOME "/Users/(whoami)/Library/Android/sdk"

set PATH $PATH ~/Library/Android/sdk/tools

