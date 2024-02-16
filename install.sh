#!/usr/bin/env bash

#Linux
if [[ `uname` == "Linux"   ]]; then
  echo "Linux detected. Using Linux config..."
  echo "Installing zsh..."
  sudo apt install zsh
  echo "Changing shell to zsh"
  sudo chsh -s $(which zsh)
  # Adding homebrew to zprofile
  echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/charlie/.zprofile
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  echo "Installing PyEnv"
  curl https://pyenv.run | bash
  echo "Installing Python"
  pyenv install 3.9.5 #latest
  pyenv global 3.9.5
fi

# Macos
if [[ `uname` == "Darwin"   ]]; then
  echo "MacOs detected. Using Darwin config..."

  echo "Installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "Installing PyEnv"
  brew install pyenv

  echo "Installing golang"
  brew install go

  echo "Installing fnm (node manager)"
  brew install fnm

  echo "Installing Git"
  brew install git
  echo "Setting up git"
  git config --global user.name "David Garcia"
  git config --global user.email "david_5043@hotmail.com"
  git config --global init.defaultBranch "master"
fi

echo "Removing existing dotfiles"
# remove files if they already exist
rm -rf ~/.config/nvim/coc-settings.json
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null
rm -rf ~/.ideavimrc

echo "Creating new .zshrc"
touch ~/.zshrc

echo "Setting up .zshrc"
cp .zshrc ~/.zshrc

echo "Apllying all configurations"
source ~/.zshrc