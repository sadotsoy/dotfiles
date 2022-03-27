#!/usr/bin/env bash

# Install Homebrew (if not installed)
if test ! $(which brew)
then
    echo "Installing Homebrew for you."

    if test "$(uname)" = "Darwin"
    then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
fi

echo "brew installed, updating and upgrading"
# Make sure we're using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

echo "brew prefix added"
# Save Homebrew's installed location.
BREW_PREFIX=$(brew --prefix)

# brew installing dev tools
echo "Installing dev tools"
brew install n
brew install neovim
brew install node
brew install openssh
brew install yarn
brew install vifm
brew install jq

# Install other useful binaries.
echo "Installing useful binaries"
brew install ag
brew install ctags
brew install exa
brew install fzf
brew install hstr
brew install tree
brew install z

ln -s "${BREW_PREFIX}/opt/fzf/install" "${BREW_PREFIX}/opt/fzf/install"

# Installs Casks
echo "Installing cask"
brew tap caskroom/cask

# Remove outdated versions from the cellar.
echo "Cleanup"
brew cleanup
