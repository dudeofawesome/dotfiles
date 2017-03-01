alias up="cd .."
alias back="cd -"
function cl -d "cd into directory and ls"
  cd $argv
  ls
end
alias l="ls -la"
alias reload="source ~/.config/fish/config.fish"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -x ANDROID_HOME "/Users/(whoami)/Library/Android/sdk"

set PATH $PATH ~/Library/Android/sdk/tools ~/Library/Android/sdk/platform-tools

set -x EDITOR /usr/local/bin/vim

