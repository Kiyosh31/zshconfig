#!/usr/bin/env bash

#Linux
if [[ `uname` == "Linux"   ]]; then
  echo "Linux detected. Using Linux config..."
  echo "Installing zsh..."
  sudo apt install zsh
  echo "Changing shell to zsh"
  sudo chsh -s $(which zsh)
  # Adding homebrew to zprofile
  echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/Kiyoshi/.zprofile
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

  echo "Installing Oh my zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  echo "Installing powerlevel10k theme"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

  echo "Installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "Installing PyEnv"
  brew install pyenv

  echo "Installing golang"
  brew install go

  echo "Installing fnm (node manager)"
  brew install fnm
  echo "Installing Node lts"
  fnm install --lts

  echo "Installing Git"
  brew install git
  echo "Setting up git"
  git config --global user.name "David Garcia"
  git config --global user.email "david_5043@hotmail.com"
  git config --global init.defaultBranch "master"

  echo "Installing Cascadia Code fonts (vscode)"
  brew tap homebrew/cask-fonts
  brew install --cask font-cascadia-code
  brew install --cask font-cascadia-code-pl
  brew install --cask font-cascadia-mono
  brew install --cask font-cascadia-mono-pl

  echo "Installing MesloLGS NF fonts (powerlink10k)"
  brew install --cask font-meslo-lg-nerd-font

  echo "Installing plugins"
  echo "zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  echo "zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# remove files if they already exist
echo "Removing existing dotfiles"
rm -rf ~/.zshrc

echo "Creating new .zshrc"
touch ~/.zshrc

echo "Setting up .zshrc"
cp zshrc ~/.zshrc

echo "Apllying all configurations"
source ~/.zshrc