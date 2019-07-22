#!/usr/bin/env bash

# Install Homebrew (if not installed)
if test ! $(which brew)
then
    echo "Installing Homebrew for you."

    # Install the correct homebrew for each OS type
    if test "$(uname)" = "Darwin"
    then
       ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    fi
fi

# Make sure we're using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew's installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget` with IRI support.
brew install wget --with-iri

brew install gmp
brew install grep
brew install openssh
brew install node
brew install yarn
brew install n

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install fish shell and fisherman
brew install fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
echo /usr/local/bin/fish >> /etc/shells
chsh -s /usr/local/bin/fish

# Install other useful binaries.
brew install jpeg
brew install neofetch
brew install exa
brew install imagemagick --with-webp
#brew install ack
#brew install autojump
#brew install git
#brew install gpg
#brew install git-lfs
#brew install imagemagick --with-webp
#brew install lua
#brew install lynx
#brew install p7zip
#brew install pigz
#brew install pv
#brew install rsync
#brew install rename
#brew install rlwrap
#brew install ssh-copy-id
#brew install tree
#brew install vbindiff
#brew install youtube-dl
#brew install zopfli

# Installs Casks
brew tap caskroom/cask

## Apps I use
brew cask install 1password
brew cask install dash
brew cask install macvim
#brew cask install brave
brew cask install iterm2
brew cask install webstorm
brew cask install postman
brew cask install slack
brew cask install telegram
brew cask install whatsapp

# Remove outdated versions from the cellar.
brew cleanup
