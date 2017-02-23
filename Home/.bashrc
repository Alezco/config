#vars =========================================================================#
                                                                               #
TERMINAL=urxvt                                                                 #
EDITOR=vim                                                                     #
export PAGER='most'                                                            #
                                                                               #
#slrn =========================================================================#
                                                                               #
export NNTPSERVER=news.epita.fr                                                #
alias slrnrl='slrn -f ~/.jnewsrc --create'                                     #
alias rmjlock='rm .jnewsrc-lock'                                               #
                                                                               #
#ls ===========================================================================#
                                                                               #
alias ls='ls --color'                                                          #
alias l='ls --color'                                                           #
alias ll='ls --color -l'                                                       #
alias la='ls --color -a'                                                       #
alias lla='ls --color -l -a'                                                   #
alias llah='ls --color -l -a -h'                                               #
                                                                               #
#debug ========================================================================#
                                                                               #
alias gdb='gdb -q'                                                             #
alias vgd='vgd-clr.sh'                                                         #
alias vgdf='vgd-clr.sh --tool=memcheck --leak-check=full --show-reachable=yes' #
                                                                               #
#config =======================================================================#
                                                                               #
alias bashrc='vim ~/.bashrc'                                                   #
alias sb='source ~/.bashrc'                                                    #
alias vimrc='vim ~/.vimrc'                                                     #
alias i3c='vim ~/.i3/config'                                                   #
                                                                               #
#vim ==========================================================================#
                                                                               #
alias v='vim'                                                                  #
alias vimrt='vim -O README TODO'                                               #
                                                                               #
#git ==========================================================================#
                                                                               #
alias mkauthors='echo "* morali_b" > AUTHORS'                                  #
alias mkreadme='echo "README: " > README'                                      #
alias nbc='git log --oneline | wc -l'                                          #
alias nbl='find . -iname "*.cc" -exec grep -vE '^#' {} \; | wc -l'             #
function nb()                                                                  #
{                                                                              #
  NBC=`nbc`                                                                    #
  NBL=`nbl`                                                                    #
  echo $NBC" commits"                                                          #
  echo $NBL" lines"                                                            #
}                                                                              #
alias nberr='make 2> e; clear && echo -n "nberr : " && cat e | wc -l && rm e'  #
alias g='git'                                                                  #
alias git='clear; git'                                                         #
alias gitl='git log'                                                           #
alias gitlf='git log --graph --oneline --all --decorate=full'                  #
alias gits='git status'                                                        #
alias gitls='git ls-files'                                                     #
alias gitsl='git shortlog'                                                     #
alias gitsls='git shortlog -s'                                                 #
alias gita='git add'                                                           #
alias gitA='git add -A'                                                        #
alias gitb='git branch'                                                        #
alias gitc='git commit -m'                                                     #
alias gitpom='git push origin master'                                          #
alias gitpr='git pull --rebase'                                                #
alias bullshit='g pr && g A && g c "Fix coding style" && g pom'                #
                                                                               #
#terminal =====================================================================#
                                                                               #
export HISTCONTROL=ignoreboth:erasedups                                        #
alias cl='clear'                                                               #
alias cls='clear; ls'                                                          #
alias tree='tree -C'                                                           #
alias ..='cd ..'                                                               #
alias ...='cd ../..'                                                           #
alias ....='cd ../../..'                                                       #
alias rmd='rm -rfv'                                                            #
function mkcd()                                                                #
{                                                                              #
  mkdir $@                                                                     #
  cd $@                                                                        #
}                                                                              #
alias c='cd'                                                                   #
function cd()                                                                  #
{                                                                              #
  builtin cd "$@"                                                              #
  RET=$?                                                                       #
  ls                                                                           #
  return $RET                                                                  #
}                                                                              #
export PS1='\[\e[;32m\][Alezco]\[\e[m\] \[\e[;31m\]$? \[\e[1;36m\]\W\[\e[m\] ' #
alias grep='grep --color=auto'                                                 #
                                                                               #
#make =========================================================================#
                                                                               #
alias make='clear; make -j9'                                                   #
alias mk='make'                                                                #
alias mkcl='make clean'                                                        #
alias mkch='make check'                                                        #
alias mkclh='make clean && make check'                                         #
alias mkd='make doc'                                                           #
alias re='make clean && make'                                                  #
                                                                               #
#compilation ==================================================================#
                                                                               #
function compile()                                                             #
{                                                                              #
  clear                                                                        #
  FILE=`echo $1 | cut -d '.' -f1`                                              #
  EXT=`echo $1 | cut -d '.' -f2`                                               #
  if [ $EXT = "c" ]; then                                                      #
    gcc -g -std=c99 -pedantic -Wall -Wextra -Werror $@ -o $FILE && ./$FILE     #
  elif [ $EXT = "cc" ]; then                                                   #
    g++ -g -std=c++14 -pedantic -Wall -Wextra -Werror $@ -o $FILE && ./$FILE   #
  fi;                                                                          #
}                                                                              #
                                                                               #
#lol ==========================================================================#
                                                                               #
alias wololo='cd /; while true; do tree -C -a -l; done'                        #
alias slf='while true; do sl -f -a -l; done'                                   #
function rainbow()                                                             #
{                                                                              #
  yes "$(seq 231 -1 16)" | while read i; do                                    #
                             printf "\x1b[48;5;${i}m\n"                        #
                             sleep .02                                         #
                           done                                                #
}                                                                              #
alias fork=':() { :|:& };:'                                                   #
function emacs()                                                               #
{                                                                              #
  echo "Real men use vim"                                                      #
}                                                                              #
alias gaby='man syscall'                                                       #
alias man="notman"                                                             #
function notman()                                                              #
{                                                                              #
  if [ "$1" = "gaby" ]; then                                                   #
    \man syscall                                                               #
  else                                                                         #
    \man $@                                                                    #
  fi                                                                           #
}                                                                              #
                                                                               #
#extract ======================================================================#
                                                                               #
function extract()                                                             #
{                                                                              #
  if [ -f $1 ]; then                                                           #
    case $1 in                                                                 #
      *.tar.bz2) tar xvjf $1 ;;                                                #
      *.tar.gz) tar xvzf $1 ;;                                                 #
      *.bz2) bunzip2 $1 ;;                                                     #
      *.gz) gunzip $1 ;;                                                       #
      *.tar) tar xvf $1 ;;                                                     #
      *.tbz2) tar xvjf $1 ;;                                                   #
      *.tgz) tar xvzf $1 ;;                                                    #
      *.zip) unzip $1 ;;                                                       #
      *) echo "'$1' cannot be extracted with extract" ;;                       #
    esac                                                                       #
  else                                                                         #
    echo "'$1' is not valid biatch !"                                          #
  fi                                                                           #
}                                                                              #
                                                                               #
#ubuntu =======================================================================#
                                                                               #
alias upd='sudo apt-get update'                                                #
alias upg='sudo apt-get upgrade'                                               #
alias uu='upd && upg'                                                          #
alias ar='sudo service apache2 restart'                                        #
alias back='cd /var/www/html/checkMail-backend'                                #
alias front='cd ~/Documents/safedesk-frontend'                                 #
alias rl='rm ~/.Xauthority; gnome-session-quit --no-prompt'                    #
                                                                               #
#==============================================================================#
