#vars =========================================================================#
                                                                               #
TERMINAL=urxvt                                                                 #
EDITOR=vim                                                                     #
PROJECT=corewar                                                                #
AUTHOR=morali_b                                                                #
PROJECTPATH=$AUTHOR-$PROJECT                                                   #
PROJECTSRC=$PROJECTPATH/src                                                    #
PROJECTTESTS=$PROJECTPATH/tests                                                #
                                                                               #
#slrn =========================================================================#
                                                                               #
export NNTPSERVER=news.epita.fr                                                #
alias slrnrl='slrn -f ~/.jnewsrc --create'                                     #
alias rmjlock='rm .jnewsrc-lock'                                               #
                                                                               #
#asm ==========================================================================#
                                                                               #
#export PATH=/opt/sparc-unknown-linux-gnu/bin:$PATH                            #
#export CC=sparc-unknown-linux-gnu-gcc                                         #
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
export PATH=$PATH:~/.my_bin                                                    #
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
function vimo()                                                                #
{                                                                              #
  vim -O $1c $1h                                                               #
}                                                                              #
                                                                               #
#git ==========================================================================#
                                                                               #
alias mkauthors='echo "* morali_b" > AUTHORS'                                  #
alias mkreadme='echo "README: " > README'                                      #
alias mktodo='cp ~/Ref/TODO .'                                                 #
alias mkmake='cp ~/Ref/Makefile .'                                             #
alias mkmain='cp ~/Ref/main.cc .'                                              #
alias mkgitignore='cp ~/Ref/.gitignore .'                                      #
function mkrepo()                                                              #
{                                                                              #
  mkauthors                                                                    #
  mkreadme                                                                     #
  mktodo                                                                       #
  mkmake                                                                       #
  mkgitignore                                                                  #
  mkdir src tests                                                              #
  cd src                                                                       #
  mkmain                                                                       #
  cd ..                                                                        #
}                                                                              #
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
alias stats='~/Scripts/Stats/stats.sh'                                         #
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
alias cdp='cd ~/'$PROJECTPATH                                                  #
alias cdps='cd ~/'$PROJECTSRC                                                  #
alias cdpt='cd ~/'$PROJECTTESTS                                                #
alias 42='cd ~/Projects/morali_b-42sh'                                         #
export PS1='\[\e[;32m\][Alezco]\[\e[m\] \[\e[;31m\]$? \[\e[1;36m\]\W\[\e[m\] ' #
alias grep='grep --color=auto'                                                 #
                                                                               #
#make =========================================================================#
                                                                               #
alias make='clear; make -j9'                                                   #
alias mk='make && ./'$PROJECT                                                  #
alias mk='make'                                                                #
alias mkcl='make clean'                                                        #
alias mkch='make check'                                                        #
alias mkclh='make clean && make check'                                         #
alias mkd='make doc'                                                           #
alias re='make clean && make'                                                  #
                                                                               #
#firefox ======================================================================#
                                                                               #
alias f='firefox'                                                              #
                                                                               #
#sql ==========================================================================#
                                                                               #
alias sql='~/Scripts/Sql/sql.sh'                                               #
function sqly1()                                                               #
{                                                                              #
  killall mysqld                                                               #
  cd ~                                                                         #
  yes "" | mysqld &                                                            #
}                                                                              #
alias sqly2='mysql --user=root --password=yakasting'                           #
alias sqly='yes "" | sqly1 && sqly2'                                           #
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
alias auto='~/Scripts/Auto/auto.py'                                            #
alias bueno='~/Scripts/Bueno/bueno.py'                                         #
                                                                               #
#other ========================================================================#
                                                                               #
export PAGER='most'                                                            #
                                                                               #
#lock  ========================================================================#
                                                                               #
alias lock='epi3lock -i ~/Pictures/stars.png -e -p default'                    #
alias moussa='epi3lock -i ~/Pictures/moussa.png -e -p default'                 #
alias kt='killall trollock vlc'                                                #
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
alias fork='~/Ref/fork'                                                        #
alias forks=':() { :|:& };:'                                                   #
function emacs()                                                               #
{                                                                              #
  echo "Real men use vim"                                                      #
}                                                                              #
alias segfault='~/Scripts/Segfault/segfault.py'                                #
alias blink='~/Scripts/Blink/blink.py'                                         #
alias sm='~/Scripts/Sm/sm.py'                                                  #
alias wsm='watch -c -n 1 ~/Scripts/Sm/sm.py'                                   #
alias gaby='man syscall'                                                       #
alias gregoire='man fdp'                                                       #
alias siarry='man fdp'                                                         #
alias man="notman"                                                             #
function notman()                                                              #
{                                                                              #
  if [ "$1" = "gaby" ]; then                                                   #
    \man syscall                                                               #
  elif [ "$1" = "gregoire" ]; then                                             #
    \man fdp                                                                   #
  elif [ "$1" = "siarry" ]; then                                               #
    \man fdp                                                                   #
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
#==============================================================================#
