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

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias gvim='open -a MacVim'

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

# bash/git completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

