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

alias s3='aws s3'

alias rdiff=$(which diff) # raw diff
alias rgrep=$(which grep) # raw grep
alias rless=$(which less) # raw less

alias grep='rgrep -I --color=always'
alias less='rless -R'
alias diff='rdiff --color=always'
alias jshell='docker run -it openjdk:10-slim /bin/jshell'

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

    PS1+="\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]"

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

export PATH=$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.cabal/bin:/usr/local/go/bin

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

alias kubesys='kubectl -n kube-system'

export PATH="$HOME/.local/bin:/usr/local/anaconda3/bin:$PATH"

alias kubeuse='kubectl config use-context'

export SPARK_HOME="$HOME/incrmntal/spark"
export PYTHONPATH="$SPARK_HOME/python"

alias kubenodes='kubectl get nodes --no-headers | awk '\''{print $1}'\'' | xargs -I {} sh -c '\''echo {} ; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo '\'''

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

