export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim

local BREW_PATH
if [ -x "/opt/homebrew/bin/brew" ]; then
    BREW_PATH="/opt/homebrew/bin/brew"
elif [ -x "/usr/local/bin/brew" ]; then
    BREW_PATH="/usr/local/bin/brew"
fi

if [ -n "$BREW_PATH" ]; then
  eval "$("$BREW_PATH" shellenv)"

  export HOMEBREW_CASK_OPTS="--appdir=~/Applications --fontdir=/Library/Fonts"

  export HOMEBREW_UPGRADE_GREEDY=1
  export HOMEBREW_NO_INSECURE_REDIRECT=1
  export HOMEBREW_CLEANUP_MAX_AGE_DAYS=30
  export HOMEBREW_CLEANUP_PERIODIC_FULL_DAYS=7

  export HOMEBREW_NO_EMOJI=1
  export HOMEBREW_NO_ANALYTICS=1
  export HOMEBREW_NO_ENV_HINTS=1
  export HOMEBREW_NO_UPDATE_REPORT_NEW=1

  export HOMEBREW_BUNDLE_NO_LOCK=1
  export HOMEBREW_BUNDLE_INSTALL_CLEANUP=1
  export HOMEBREW_BUNDLE_FILE_GLOBAL="$HOME"/.Brewfile
  export HOMEBREW_BUNDLE_FILE="$HOMEBREW_BUNDLE_FILE_GLOBAL"
fi

