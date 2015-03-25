# Theme
source ~/.slick

# Variables

# Fixes
export LC_ALL="en_US.utf8"
export LANG="en_US.utf8"
export LANGUAGE="en_US.utf8"

# Aliases
alias profile="vim ~/.profile; source ~/.profile"

alias sl='ls'
alias ls='ls --color'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'

alias c='clear'
alias k='clear'
alias cls='clear; ls'

alias q='exit'

alias md='mkdir -p'

if [ ! -x "$(which tree 2>/dev/null)" ]
then
  alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

