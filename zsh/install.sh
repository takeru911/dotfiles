#!/usr/bin/zsh

set -eu

# install zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
# install prezto
source ./init.zshrc
zplug install
rm $HOME/.zshrc $HOME/.zlogin $HOME/.zlogout $HOME/.zprofile $HOME/.zshenv
setopt EXTENDED_GLOB

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
echo "source $HOME/dotfiles/zsh/.zshrc" >> $HOME/.zshrc
source $HOME/.zshrc

