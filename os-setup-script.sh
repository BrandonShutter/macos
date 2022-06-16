#!/usr/bin/env bash
# Setup script for setting up a new macos machine
echo "Starting setup"
# install xcode CLI
if test ! $(xcode-select); then
    echo "Installing xcode..."
    xcode-select --install
fi


# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

PACKAGES=(
ansible
awscli
jckuester/tap/awsls
jckuester/tap/awsrm
brew-pip
azure-cli
coreutils
curl
ffmpeg
git
git-extras
grep
imagemagick
oci-cli
openssl@3
pyenv
pyenv-virtualenv
python@3.10
terraform-docs
terraformer
tfenv
wget
)
echo "Installing packages..."
brew install ${PACKAGES[@]}
# any additional steps you want to add here
# link readline
brew link --force readline

echo "Cleaning up..."
brew cleanup

echo "Installing Python packages..."
PYTHON_PACKAGES=(
    virtualenv
    virtualenvwrapper
)
pip install ${PYTHON_PACKAGES[@]}

echo "Installing cask..."
CASKS=(
1password
appcleaner
chromedriver
cyberduck
discord
# dropbox   
firefox  
gas-mask
google-chrome 
handbrake
hazel
imageoptim
insomnia
league-of-legends
selfcontrol
slack
spectacle
spotify
visual-studio-code
vlc
wavebox
)
echo "Installing cask apps..."
brew install ${CASKS[@]}

echo "Configuring OS..."
# Set fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0
# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true


echo "Macbook setup completed!"