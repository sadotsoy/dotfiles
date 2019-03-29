echo "clone tap CHUNKWM and SKHD"
brew tap koekeishiya/formulae

echo "Installing Chunkwm"
brew install chunkwm

echo "Installing Skhd"
brew install koekeishiya/formulae/skhd

echo "Installing configs"
ln -s "chunkwmrc" "${HOME}/.chunkwmrc"
ln -s "skhdrc" "${HOME}/.skhdrc"

echo "Starting services CHUNKWM + SKHD"
brew services start chunkwm
brew services start skhd
