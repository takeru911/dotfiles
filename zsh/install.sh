#!/bin/zsh

_PID=$$;
_PPID=$(ps -o ppid -p $_PID | tail -n 1);

if ps -p $_PPID | grep -qs bash ; then
    echo "bash"
elif ps -p $_PPID | grep -qs zsh ; then
    echo "zsh"
fi
h=`ps -p $_PPID`
echo $h
set -eu

# install preztocho 
source ~/.zshrc
zplug install

rm $HOME/.zshrc $HOME/.zlogin $HOME/.zlogout $HOME/.zprofile $HOME/.zshenv
setopt EXTENDED_GLOB

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
echo "source $HOME/dotfiles/zsh/.zshrc" >> $HOME/.zshrc
source $HOME/.zshrc
