#!/bin/sh

# Include some basic libs
source libs.sh

# Set continue to false by default
CONTINUE=false

echo ""
cecho "┌─────────────────────────────────────────────┐" $red
cecho "│ ×-+       macOS Post-Install Script         │" $red
cecho "├─────────────────────────────────────────────┤" $red
cecho "│                                             │" $red
cecho "│        DO NOT RUN THIS SCRIPT BLINDLY       │" $red
cecho "│         YOU'LL PROBABLY REGRET IT...        │" $red
cecho "│                                             │" $red
cecho "│              READ IT THOROUGHLY             │" $red
cecho "│         AND EDIT TO SUIT YOUR NEEDS         │" $red
cecho "│                                             │" $red
cecho "└─────────────────────────────────────────────┘" $red
echo ""

echo ""
cecho "Have you read through the script you're about to run and " $yellow
cecho "understood that it will make changes to your computer? (y/n)" $yellow
tput bel
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" $green
  exit
fi

# Ask the user some questions about their device
source device-info.sh

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Run all the commands
source move-dotfiles.sh
source settings/install-software.sh
source settings/ui-ux.sh
source settings/audio.sh
source settings/keyboard-mouse.sh
source settings/screen.sh
source settings/finder.sh
source settings/dock.sh
source settings/mission-control.sh
source settings/sharing.sh
source settings/browsers.sh
source settings/mail.sh
source settings/terminal.sh
source settings/time-machine.sh
source settings/transmission.sh
source settings/git.sh
source services/install.sh

# Kill affected applications
echo ""
cecho "Done!" $cyan
echo ""
echo ""
cecho "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" $white
echo ""
echo ""
cecho "Killing some open applications in order to take effect." $red
cecho "Press enter when you are ready" $yellow
tput bel
read
echo ""

find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
  "Terminal" "Transmission"; do
  killall "${app}" > /dev/null 2>&1
done

cecho "Note that some of these changes require a logout/restart to take effect." $red
