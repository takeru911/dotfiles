# set language
export LANG=ja_JP.UTF-8

# User specific aliases and functions
export PATH=$PATH:${HOME}/bin
export PATH=$PATH:${HOME}/.cask/bin
export PATH=$PATH:${HOME}/.local/bin
export PATH=${HOME}/miniconda3/bin:$PATH

# Created by newuser for 5.0.2
source ~/.zplug/init.zsh

# my zsh plugin

zplug "mollifier/anyframe"
zplug "mollifier/cd-gitroot"
zplug "zsh-users/zsh-history-substring-search", hook-build:"__zsh_version 4.3"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
#zplug "peco/peco", as:command, from:gh-r, use:"*amd64*"
zplug "zsh-users/zsh-autosuggestions"
zplug "sorin-ionescu/prezto"

zplug load
zstyle ":anyframe:selector:" use fzf
# keybinding
bindkey '^x^p' history-substring-search-up
bindkey '^x^n' history-substring-search-down
bindkey '^x^h' anyframe-widget-execute-history
bindkey '^x^b' anyframe-widget-checkout-git-branch

# zsh settings
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1
#zstyle ':prezto:module:prompt' theme 'steeef'
prompt steeef

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'
setopt GLOBDOTS
#prompt
#autoload -Uz vcs_info
#setopt prompt_subst
#zstyle ':vcs_info:git:*' check-for-changes true
#zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
#zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
#zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
#zstyle ':vcs_info:*' actionformats '[%b|%a]'

# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

function paste_win_clip(){
    BUFFER=${LBUFFER}$(win32yank.exe -o --lf)${RBUFFER}
    zle reset-prompt
}

function copy_win_clip(){
    echo ${BUFFER} | win32yank.exe -i
}

zle -N paste_win_clip
zle -N copy_win_clip
bindkey '^x^y' paste_win_clip
bindkey '^x^k' copy_win_clip
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# alias
alias cgr=cd-gitroot
# alias curl=/usr/local/bin/curl
## git
alias mm="git fetch -vp && git pull --rebase origin master"
function ghc(){
    if [ $# -eq 1 ]
    then
        SEARCH_WORD=$1
        git --no-pager reflog | awk '$3 == "checkout:" && /moving from/ {print $8}' | uniq | grep ${SEARCH_WORD} | fzf | xargs git checkout
    else
        git --no-pager reflog | awk '$3 == "checkout:" && /moving from/ {print $8}' | uniq | head -n 30 | fzf | xargs git checkout
    fi
    
}
## win32yank
alias wip="win32yank.exe -o --lf"
alias wic="win32yank.exe -i"

alias a="awk"
alias c="cd"
alias e="emacs"
alias g="git"
alias h="head"
alias p="pwd"

# opt
setopt IGNOREEOF

if [ -e $HOME/dotfiles/zsh/.myzshrc ]; then
    source $HOME/dotfiles/zsh/.myzshrc
fi

alias history-all="history 1"
export LESS='-g -i -M -R -S -w -z-4 -m'

nvm() {
    # まず仮の nvm コマンドを unset
    unset -f nvm

    # nvm.sh をロード
    # ここで本物の nvm コマンドが定義される
    source "${NVM_DIR:-$HOME/.nvm}/nvm.sh"

    # 仮の nvm コマンドに渡された引数を本物に受け渡す
    nvm "$@"
}
if [ -e ${HOME}/.nvm ]; then
  NODE_DEFAULT=versions/node/v$(cat ${NVM_DIR:-$HOME/.nvm}/alias/default)
  PATH=${NVM_DIR:-$HOME/.nvm}/${NODE_DEFAULT}/bin:$PATH
  MANPATH=${NVM_DIR:-$HOME/.nvm}/${NODE_DEFAULT}/share/man:${MANPATH}
  export NODE_PATH=${NVM_DIR:-$HOME/.nvm}/${NODE_DEFAULT}/lib/node_modules
fi
