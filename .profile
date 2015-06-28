# Theme
source ~/.slick

# Working Directory
alias work="cd ~/dev/icebreaker/website"

# Start Unity
alias go="startunity"

# Variables 

# Fixes
export LC_ALL="en_US.utf8"
export LANG="en_US.utf8"
export LANGUAGE="en_US.utf8"

# Aliases
alias mongod="sudo mongod --smallfiles"

alias profile="vim ~/.profile; source ~/.profile"

alias sl='ls'
alias ls='ls --color'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='c;l1;'
alias l1='ls -1'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c='clear'
alias k='clear'
alias cls='clear; ls'

alias q='exit'

alias md='mkdir -p'

alias n='nautilus .'

alias jedit='subl *.java'
alias cedit='subl *.*pp'

alias fuck='sudo !!'
alias please='sudo !!'


# Functions
j() {
  clear
  echo 'Compiling...'
  javac $1.java || return
  echo 'Running...'
  java $1
}

c++ () {
  clear
  echo 'Compiling...'
  g++ -std=c++11 $1.cpp -o $1 || return
  echo 'Running...'
  ./$1
  echo 'Success!'
}

sfml () {
  clear
  echo 'Compiling...'
  g++ -std=c++11 $1.cpp -o $1 -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio || return
  echo 'Running...'
  ./$1 
  echo 'Success!' 
}

hask () {
  clear
  echo 'Compiling...'
  ghc $1.hs || return
  echo 'Running...'
  ./$1
}

if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

# Transfer alias
transfer() { if [ $# -eq 0 ];then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }; alias transfer=transfer;

 



echo "Profile changed"
