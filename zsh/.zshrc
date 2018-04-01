# User specific aliases and functions
export PATH=$PATH:${HOME}/bin
export PATH=$PATH:${HOME}/.cask/bin

# Created by newuser for 5.0.2
source ~/.zplug/init.zsh

# my zsh plugin

zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
zplug "zsh-users/zsh-history-substring-search", hook-build:"__zsh_version 4.3"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "peco/peco", as:command, from:gh-r, use:"*amd64*"
zplug "zsh-users/zsh-autosuggestions"
zplug "sorin-ionescu/prezto"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
zplug load
zstyle ":anyframe:selector:" use fzf

# keybinding
bindkey '^x^p' history-substring-search-up
bindkey '^x^n' history-substring-search-down
bindkey '^x^h' anyframe-widget-execute-history

# zsh settings
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
