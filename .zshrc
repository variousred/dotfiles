# https://github.com/thrig/zsh-compdef
# Various ZSH completion scripts. These require http://www.zsh.org/ and
# must be located in a $fpath directory, for example under
# ~/.zsh/functions via the following in the ~/.zshrc config file:

autoload -U colors
colors

fpath=(~/.zsh/functions $fpath)

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Dont append shell command history until window is closed
setopt APPEND_HISTORY

# Customize to your needs...
export PATH="/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"

# RVM setup
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias be=bundle\ exec
alias cd.="cd .. && cd -"


setopt promptsubst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*:*' get-revision true
zstyle ':vcs_info:git*:*' check-for-changes true

# hash changes branch misc
zstyle ':vcs_info:git*' formats "(%s) %12.12i %c%u %b%m"
zstyle ':vcs_info:git*' actionformats "(%s|%a) %12.12i %c%u %b%m"

zmodload zsh/complist
autoload -U compinit && compinit

### If you want zsh's completion to pick up new commands in $path automatically
#### comment out the next line and un-comment the following 5 lines
zstyle ':completion:::::' completer _complete _approximate
##_force_rehash() {
##  (( CURRENT == 1 )) && rehash
##  return 1  # Because we didn't really complete anything
##}
##zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX +
$#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes

source ~/.zsh/git.zsh
source ~/.zsh/git.plugin.zsh
source ~/.zsh/g5promatic.zsh-theme

# Bitbucket Repo
function bb() {
  CURRENT_FOLDER="${PWD##*/}"
  OPEN_SITE="open https://bitbucket.org/g5dev/$CURRENT_FOLDER"
  eval $OPEN_SITE
}

# Bitbucket Pull Request
function bbp() {
  CURRENT_FOLDER="${PWD##*/}"
  # OPEN_SITE="open https://bitbucket.org/g5dev/$CURRENT_FOLDER"
  OPEN_SITE="open https://bitbucket.org/g5dev/$CURRENT_FOLDER/pull-request/new"
  eval $OPEN_SITE
}

# Github Repo Branch
function gg() {
  CURRENT_FOLDER="${PWD##*/}"
  CURRENT_BRANCH="$(git branch | grep "*" | sed "s/* //")"
  OPEN_SITE="open https://github.com/g5search/$CURRENT_FOLDER/tree/$CURRENT_BRANCH"
  eval $OPEN_SITE
}
# Github Pull Request for Current Branch
function ggp() {
  CURRENT_FOLDER="${PWD##*/}"
  CURRENT_BRANCH="$(git branch | grep "*" | sed "s/* //")"
  OPEN_SITE="open https://github.com/g5search/$CURRENT_FOLDER/pull/new/$CURRENT_BRANCH"
  eval $OPEN_SITE
}
