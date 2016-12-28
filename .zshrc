#---------------------------------------------------------------------------
# General
#---------------------------------------------------------------------------
# Lang
export LANG=ja_JP.UTF-8
## LaTeX
# export LANG=ja_JP.eucJP
setopt no_beep
# Title
case "${TERM}" in
kterm*|xterm*|terminal*)
 precmd() {
  echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
 }
 ;;
esac
# Spell check
setopt correct
# Vim like key bind
bindkey -v

#---------------------------------------------------------------------------
# History
#---------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt hist_no_store
setopt hist_reduce_blanks
setopt extended_history
setopt inc_append_history
setopt hist_ignore_space
setopt hist_verify
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

#---------------------------------------------------------------------------
# Complement
#---------------------------------------------------------------------------
autoload -U compinit
compinit
setopt auto_pushd
setopt correct
setopt correct_all
setopt hist_expand
setopt list_types
setopt auto_list
setopt auto_menu
setopt list_packed
setopt auto_param_keys
setopt auto_param_slash
setopt mark_dirs
setopt auto_cd
setopt magic_equal_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt nolistbeep

#---------------------------------------------------------------------------
# Alias
#---------------------------------------------------------------------------
alias ls="ls -F --color"
alias ll="ls -Fltr --color"
alias la="ls -lhAF --color"
alias pd="pushd"
alias po="popd"
alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
alias gip='curl ipcheck.ieserver.net'
alias SU='sudo -H -s'

#---------------------------------------------------------------------------
# Color
#---------------------------------------------------------------------------
autoload -U colors
colors

#---------------------------------------------------------------------------
# Prompt
#---------------------------------------------------------------------------
PROMPT="%{${fg[green]}%}%n%{${fg[red]}%}@%{${fg[cyan]}%}%m %{${fg[yellow]}%}%~ %{${fg[red]}%}%# %{${reset_color}%}"
PROMPT2="%{${fg[yellow]}%} %_ > %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r ? [n,y,a,e] %{${reset_color}%}"


#---------------------------------------------------------------------------
# Appearance
#---------------------------------------------------------------------------
setopt prompt_subst

#---------------------------------------------------------------------------
# LS Color
#---------------------------------------------------------------------------
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#---------------------------------------------------------------------------
# Function
#---------------------------------------------------------------------------
# Mkdir+Cd
function mkcd() {
  if [[ -d $1 ]]; then
    echo "It already exsits! Cd to the directory."
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}

# Find+Grep
fg () { find . -type f -print | xargs grep -n --binary-files=without-match $@ }

# 256color test
function 256colortest() {
    local code
    for code in {0..255}; do
        echo -e "\e[38;05;${code}m $code: Test"
    done
}
function chpwd() { ls }


# tmux setting
#if [ -z $TMUX ]; then
#  tmux -2
#fi

# local zshrc load
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
