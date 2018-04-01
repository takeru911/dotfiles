#!/usr/bin/zsh

set -eu

# install prezto
echo "source ~/.zplug/init.zsh" >> $HOME/.zshrc
echo "zplug \"sorin-ionescu/prezto\"" >> $HOME/.zshrc
echo "zplug load --verbose" >>  $HOME/.zshrc
source $HOME/.zshrc
zplug install

rm $HOME/.zshrc $HOME/.zlogin $HOME/.zlogout $HOME/.zprofile $HOME/.zshenv
setopt EXTENDED_GLOB

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
echo "source $HOME/dotfiles/zsh/.zshrc" >> $HOME/.zshrc
source $HOME/.zshrc
