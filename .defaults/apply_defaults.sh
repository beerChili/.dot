#!/usr/bin/env sh
set -eu

osascript -e 'tell application "System Settings" to quit'
sudo -v

# UI / UX
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Typing & input
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 12
defaults write NSGlobalDomain com.apple.trackpad.scaling -int 7
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Screen & screenshots
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture show-thumbnail -bool false

# Finder
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Dock & Mission Control
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false

# Mail
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# Spotlight
defaults write com.apple.spotlight orderedItems -array \
  '{"enabled"=1;"name"="APPLICATIONS";}' \
  '{"enabled"=1;"name"="SYSTEM_PREFS";}' \
  '{"enabled"=1;"name"="DIRECTORIES";}' \
  '{"enabled"=0;"name"="PDF";}' \
  '{"enabled"=0;"name"="FONTS";}' \
  '{"enabled"=0;"name"="DOCUMENTS";}' \
  '{"enabled"=0;"name"="MESSAGES";}' \
  '{"enabled"=0;"name"="CONTACT";}' \
  '{"enabled"=0;"name"="EVENT_TODO";}' \
  '{"enabled"=0;"name"="IMAGES";}' \
  '{"enabled"=0;"name"="BOOKMARKS";}' \
  '{"enabled"=0;"name"="MUSIC";}' \
  '{"enabled"=0;"name"="MOVIES";}' \
  '{"enabled"=0;"name"="PRESENTATIONS";}' \
  '{"enabled"=0;"name"="SPREADSHEETS";}' \
  '{"enabled"=0;"name"="SOURCE";}' \
  '{"enabled"=0;"name"="MENU_SPOTLIGHT_SUGGESTIONS";}'
killall mds >/dev/null 2>&1
sudo mdutil -i on / >/dev/null 2>&1
sudo mdutil -E / >/dev/null 2>&1

# TextEdit
defaults write com.apple.TextEdit RichText -int 0
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Photos
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Restart affected apps
for app in cfprefsd Dock Finder Mail SystemUIServer; do
  killall "$app" >/dev/null 2&>1
done

echo "Done. Some changes require logout/restart."
