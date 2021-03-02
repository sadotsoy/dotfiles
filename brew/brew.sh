#!/usr/bin/env bash

# Install Homebrew (if not installed)
if test ! $(which brew)
then
    echo "Installing Homebrew for you."

    # Install the correct homebrew for each OS type
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

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
echo "installing utils"
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# brew installing dev tools
echo "Installing dev tools"
brew install alacritty
brew install gmp
brew install grep
brew install n
brew install neovim
brew install node
brew install openssh
brew install yarn

# Install font tools.
echo "Installing fonts utils"
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2
brew tap bramstein/webfonttools

# Install fish shell and fisher plugin manager
echo "Installing fish, fisher and setted to default shell"
brew install fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
# sudo bash -c 'echo "/usr/local/bin/fish" > /etc/shells'
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# Install other useful binaries.
echo "Installing useful binaries"
brew install ag
brew install ctags
brew install exa
brew install fzf
brew install hstr
brew install imagemagick --with-webp
brew install jpeg
brew install neofetch
brew install tree
brew install z

ln -s "${BREW_PREFIX}/opt/fzf/install" "${BREW_PREFIX}/opt/fzf/install"

# Installs Casks
echo "Installing cask"
brew tap caskroom/cask

# Remove outdated versions from the cellar.
echo "Cleanup"
brew cleanup
