#variables =====================================================================

EDITOR=vim
export PAGER='most'
export HISTCONTROL=ignoreboth:erasedups
export ZSH="/Users/benjaminmorali/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

#alias =========================================================================

alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias llah='ls -lah'
alias bashrc='vim ~/.bash_profile'
alias sb='source ~/.bash_profile'
alias zshrc='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias v='vim'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias rmd='rm -rfv'
alias c='cd'

#functions =====================================================================

function mkcd
{
  mkdir $@
  cd $@
}

function cd()
{
  builtin cd "$@"
  RET=$?
  ls
  return $RET
}

function extract()
{
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2) tar xvjf $1 ;;
      *.tar.gz) tar xvzf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xvf $1 ;;
      *.tbz2) tar xvjf $1 ;;
      *.tgz) tar xvzf $1 ;;
      *.zip) unzip $1 ;;
      *) echo "'$1' cannot be extracted with extract" ;;
    esac
  else
    echo "'$1' is not valid!"
  fi
}

#git ===========================================================================

alias nbc='git log -oneline | wc -l'
alias nbl='find . -iname "*.js" -exec grep -vE '^#' {} \; | wc -l'
alias g='git'
alias bullshit='g pr && g A && g c "Fix coding style" && g pom'
function nb()
{
 NBC=`nbc`
 NBL=`nbl`
 echo $NBC" commits"
 echo $NBL" lines"
}

#lol ===========================================================================

alias wololo='cd /; while true; do tree -C -a -l; done'
alias fork=':() { :|:& };:'
alias man="notman"
function rainbow()
{
  yes "$(seq 231 -1 16)" | while read i; do
                             printf "\x1b[48;5;${i}m\n"
                             sleep .02
                           done
}
function emacs()
{
  echo "Real men use vim"
}

#yarn ==========================================================================

alias y='yarn'
alias ys='yarn start'
alias yd='yarn dev'
alias yb='yarn build'
alias yt='yarn test'
