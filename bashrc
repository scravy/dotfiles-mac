# apply for interactive shells only (do not fuck around with shell scripts)
case $- in
    *i*) ;;
      *) return;;
esac

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -lAh'
alias llt='ls -lAhtr'
alias gls='git status'
alias mysql='/usr/local/mysql/bin/mysql'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias gvim='open -a MacVim'

alias heidi='wine /Applications/HeidiSQL_9.4_Portable/heidisql.exe'
alias s3='aws s3'

alias rgrep=$(which grep) # raw grep
alias rless=$(which less) # raw less

alias grep='rgrep -I --color=always'
alias less='rless -R'

# do not put duplicate lines or lines starting with a space in the history
HISTCONTROL=ignoreboth

# append to history file - do not overwrite it
shopt -s histappend

# check window size and update LINES and COLUMNS after every command
shopt -s checkwinsize

# some color variables for convenience
GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"

RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
CYAN="\[$(tput setaf 6)\]"
RESET="\[$(tput sgr0)\]"

# multiline prompt
__prompt_command() {
    local EXIT="$?"             # This needs to be first
    PS1="`date +%H:%M:%S` "

    PS1+="\[\033[01;32m\]\u@`hostname`\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]"

    if [ $EXIT != 0 ]; then
        PS1+=" (${RED}${EXIT}${RESET})"
    else
        PS1+=" (${GREEN}${EXIT}${RESET})"
    fi

    PS1+=$'\n'
    PS1+="${CYAN}"
    PS1+='$'
    PS1+="${RESET} "
}

PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

alias gll="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

scala11() {
  sbt -batch 'set scalaVersion := "2.11.11"' console
}

scala12() {
  sbt -batch 'set scalaVersion := "2.12.2"' console
}

eval "$(thefuck --alias)"

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.cabal/bin:/Users/julian/Library/Android/sdk/tools:/Users/julian/Library/Android/sdk/platform-tools:/Users/julian/Library/Haskell/bin:/Users/julian/.vimpkg/bin
