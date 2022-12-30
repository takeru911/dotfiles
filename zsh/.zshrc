#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
setopt GLOBDOTS
#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
setopt CORRECT

# Customize spelling correction prompt.
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi


export PATH="$PATH:${HOME}/.local/bin"
export PATH="$PATH:${HOME}/.cask/bin"
source ${HOME}/.fzf.zsh
# set language
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LANGUAGE=ja_JP.UTF-8
export HISTSIZE=1000
export SAVEHIST=100000

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

frepo() {
  local dir
  dir=$(ghq list > /dev/null | fzf --reverse +m) &&
    cd $(ghq root)/$dir
}

if [ -e ${HOME}/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  export PATH="$PYENV_ROOT/shims:$PATH"
  pyenv() {
    unfunction "$0"
    source <(pyenv init -)
    $0 "$@"
  }
fi

if [ -e $HOME/dotfiles/zsh/.myzshrc ]; then
    source $HOME/dotfiles/zsh/.myzshrc
fi

eval "$(direnv hook zsh)"

# aliases
alias history-all="history 1"
alias mm="git fetch -vp && git pull --rebase origin master"
alias a="awk"
alias c="cd"
alias e="emacs"
alias g="git"
alias h="head"
alias p="pwd"
alias b="bat"
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c -a emacs"
alias emax="emacsclient -t"
alias semac="sudo emacsclient -t"
alias emacsc="emacsclient -c -a emacs"
alias emacs='emacsclient -c -a ""'
export LESS='-g -i -M -R -S -w -z-4 -m'

source ${ZIM_HOME}/init.zsh


# Initialize modules.

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#


zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey $terminfo[kcuu1] history-substring-search-up
bindkey $terminfo[kcud1] history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
unset key

# }}} End configuration added by Zim install

# set cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true
