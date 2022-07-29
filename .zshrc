ZSH_THEME="norm"

# Environment Variables
export GPG_TTY=$(tty)
export DEFAULT_USER="christophergregorian"
export EDITOR=vim

# Aliases
eval $(thefuck --alias)
alias profile="$EDITOR ~/.zshrc && source ~/.zshrc"
alias c=clear
alias q=exit
alias ll="ls -la"
alias l="l1"
alias gll="git lg"
alias gs="git status"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset %C(bold blue)%<(15,mtrunc)%an%Creset %<(50,trunc)%s %Cgreen(%cr)%Creset%C(yellow)%d' --abbrev-commit"

fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

alias weather="curl http://wttr.in/Windsor"

# ZSH config
# Path to your oh-my-zsh installation.
export ZSH=/Users/christophergregorian/.oh-my-zsh

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.bash_profile

# CTRL-G - Select recent git branch from fzf
fzf-recent-branch-widget() {
  setopt localoptions pipefail no_aliases 2> /dev/null
  echo  # retain current prompt line
  git for-each-ref --count=100 --sort=-committerdate refs/heads/ --format='%(refname:short)' \
    | fzf --height 50 --preview 'git diff --stat --patch --color $(git merge-base master {-1}) {-1}' \
    | xargs git checkout
  local ret=$?
  zle send-break
  return $ret
}

zle     -N   fzf-recent-branch-widget
bindkey '^G' fzf-recent-branch-widget
