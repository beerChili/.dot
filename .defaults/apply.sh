#!/usr/bin/env bash

# Quit System Settings to avoid conflicts
osascript -e 'tell application "System Settings" to quit'

# Ask for sudo and keep it alive
sudo -v
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

###############################################################################
# UI / UX                                                                    #
###############################################################################

# Silence boot sound (Intel only; Apple Silicon ignores it)
sudo nvram SystemAudioVolume=" "

# Faster window resize
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Expanded print panel & auto-quit printer app
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Skip “Are you sure?” on open
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable auto-termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Reveal battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

###############################################################################
# Typing & input                                                             #
###############################################################################

# Full keyboard access (Tab in dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys (use repeater)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Fastest key repeat
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

###############################################################################
# Screen & screenshots                                                       #
###############################################################################

# Require password immediately after sleep/screensaver
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to Desktop, PNG, no shadow, no floating thumbnail
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture show-thumbnail -bool false

###############################################################################
# Finder                                                                     #
###############################################################################

# Quit via ⌘Q (hides icons), no animations
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder DisableAllAnimations -bool true

# New Finder windows open to Home folder
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show all extensions, status bar, path bar, full POSIX path in title
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Folders first, search current folder by default, no extension-change warning
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid .DS_Store on network/USB, auto-open volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Snap icons to grid
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# No warning before emptying Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

###############################################################################
# Dock & Mission Control                                                     #
###############################################################################

# No launch animation, fast Mission Control, no auto-reorder Spaces
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock mru-spaces -bool false

# Auto-hide Dock, hide recents
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false

###############################################################################
# Safari & WebKit                                                            #
###############################################################################

# Privacy: no Apple search suggestions
defaults write com.apple.safari universalsearchenabled -bool false
defaults write com.apple.safari suppresssearchsuggestions -bool true

# Full URL in Smart Search Field
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Prevent auto-open of “safe” files
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Develop menu & Web Inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Continuous spellcheck, no auto-correct
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# Mail                                                                       #
###############################################################################

defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true
defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"

###############################################################################
# Spotlight                                                                   #
###############################################################################

# Custom search order
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
  '{"enabled"=0;"name"="MENU_DEFINITION";}' \
  '{"enabled"=0;"name"="MENU_OTHER";}' \
  '{"enabled"=0;"name"="MENU_CONVERSION";}' \
  '{"enabled"=0;"name"="MENU_EXPRESSION";}' \
  '{"enabled"=0;"name"="MENU_WEBSEARCH";}' \
  '{"enabled"=0;"name"="MENU_SPOTLIGHT_SUGGESTIONS";}'
killall mds >/dev/null 2>&1
sudo mdutil -i on / >/dev/null
sudo mdutil -E / >/dev/null

###############################################################################
# TextEdit & App Store                                                       #
###############################################################################

# Plain-text UTF-8 in TextEdit
defaults write com.apple.TextEdit RichText -int 0
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Automatic updates & background downloads
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

###############################################################################
# Photos                                                                     #
###############################################################################

# Don’t auto-open Photos when devices connect
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Restart affected apps                                                      #
###############################################################################

for app in "cfprefsd" "Dock" "Finder" "Mail" "Safari" "SystemUIServer"; do
  killall "${app}" &>/dev/null
done

echo "Done. Some changes require logout/restart to take full effect."
