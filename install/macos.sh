echo "\n [System Preferences]: Starting\n"

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "ivaquero"
sudo scutil --set HostName "ivaquero"

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'Tell Application "System Preferences" to quit'

echo "\n [System Preferences]: Pasword Required -> Changes to System Preferences"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

echo "\n [System Preferences]: Configuring System...\n"
sh macos-system.zsh

echo "\n [System Preferences]: Configuring Apps...\n"
sh macos-apps.zsh

for app in "Activity Monitor" \
    "Address Book" \
    "Calendar" \
    "Contacts" \
    "Dock" \
    "Finder" \
    "Mail" \
    "Messages" \
    "Photos" \
    "Safari" \
    "SystemUIServer" \
    "Terminal"; do
    killall "${app}" &>/dev/null
done

echo "\n [System Preferences]: COMPLETE\n"
echo "\n [System Preferences]: Note that some of these changes require a logout/restart to take effect.\n"
