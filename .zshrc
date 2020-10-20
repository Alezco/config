#variables =====================================================================

EDITOR=vim
export PAGER='most'
export HISTCONTROL=ignoreboth:erasedups
export ZSH="/Users/benjamin/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
unsetopt PROMPT_SP
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

#alias =========================================================================

alias l='ls'
alias lla='ls -la'
alias llah='ls -lah'
alias c='cd'
alias g='git'
alias bashrc='vim ~/.bash_profile'
alias sb='source ~/.bash_profile'
alias zshrc='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias v='vim'
alias rmd='rm -rfv'
alias nbl='find . -iname "*.js" -exec grep -vE '^#' {} \; | wc -l'
alias bullshit='g pr && g A && g c "Fix coding style" && g pom'
alias y='yarn'
alias ys='yarn start'
alias yd='yarn dev'
alias yda='yarn dev-app'
alias yb='yarn build'
alias yt='yarn test'
alias ya='yarn android'

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
