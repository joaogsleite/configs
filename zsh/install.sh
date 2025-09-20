#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

if [ "$(uname)" == "Darwin" ]; then
  brew install zsh
else
  sudo apt install -y zsh
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

chsh -s /bin/zsh

ln -sfn $PWD/config/zshrc $HOME/.zshrc
ln -sfn $PWD/config/forward $HOME/.forward
ln -sfn $PWD/config/hushlogin $HOME/.hushlogin
ln -sfn $PWD/config/bash_profile $HOME/.bash_profile
ln -sfn $PWD/config/profile $HOME/.profile
sudo ln -sfn $PWD/config/hosts /etc/hosts
