#variables =====================================================================

EDITOR=vim
export PAGER='most'
export HISTCONTROL=ignoreboth:erasedups
export ZSH="/home/benjamin/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
unsetopt PROMPT_SP

#alias =========================================================================

alias l='ls'
alias lla='ls -la'
alias llah='ls -lah'
alias c='cd'
alias g='git'
alias zshrc='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias v='vim'
alias rmd='rm -rfv'
alias bullshit='g pr && g A && g c "Fix coding style" && g pom'
alias y='yarn'
alias ys='yarn start'
alias yd='yarn dev'
alias yt='yarn test'
alias mi='make install-no-docker'
alias ms='make start-no-docker'

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

function tb()
{
  g fetch && g co $1 && y && y lint && yt && g s
}

#lol ===========================================================================

alias fork=':() { :|:& };:'
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
