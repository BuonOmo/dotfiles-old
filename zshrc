## Nice drawing
#echo
#fortune literature | cowsay -W 80 -f $(cowthink -l | tail -n +2 | tr '
#' ' ' | cut -d " " -f$(($RANDOM % 51 + 1)))
[ -f ~/.todo ] && cat ~/.todo

# Path to your oh-my-zsh installation.
if [ -d /Users ]; then
  export ZSH=/Users/$USER/.oh-my-zsh
else
  export ZSH=/home/$USER/.oh-my-zsh
fi
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="refined"

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
# HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  npm
  common-aliases
  zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting
)

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

source $ZSH/oh-my-zsh.sh

# My exports
export EDITOR=/usr/bin/vim

# My functions (in ~/oh-my-zsh/functions)
autoload -Uz hy

# My aliases

## Generic aliases (sorted alphabetically)
alias atoms='atom --safe'
alias cpv='rsync -ah --progress' # visual cp
alias du='du -h' # human readable
alias dus='du -h --summarize'
alias internet='if ! ping -c 1 google.com > /dev/null;then (>&2 echo "Internet not working."); false;fi'
alias l='ls -lAFh'
alias la='ls -la'
alias nbsp="if ! ag  ;then echo all fine.;fi" # detect non breaking spaces
alias now='date +%T'
alias rm='/bin/rm --preserve-root'
# @example: pdfcompress old.pdf > new.pdf
# -dPDFSETTINGS="/screen|/ebook|/printer|/prepress" from worse to best
alias pdfcompress='gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS="/screen" -sOutputFile=-'
alias remember='history | grep -A 10 -B 1'
alias starwars='telnet towel.blinkenlights.nl'
alias t='time cat' # dead simple timer, used with ctrl+c
alias vdiff='vimdiff'
alias :q=exit

## Git aliases
function g-() {
  git checkout @{-${1:-1}}
}
alias g--='for i in {1..10};do echo $i: $(git rev-parse --abbrev-ref @{-$i});done'
alias gapan='git add --intent-to-add . && git add --patch'
alias gcf='git commit --fixup=HEAD'
alias gcopa='git checkout --patch'
alias gcub='git rev-parse --abbrev-ref HEAD' # git last branch
alias glb='git rev-parse --abbrev-ref @{-1]'
alias gpf='git push --force-with-lease'
alias grbim='git rebase -i master'
alias grmb='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

## Global aliases
alias -g PO='&& poweroff'
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g GLB='$(glb)'
alias -g GCUB='$(gcub)'

## Clipboard aliases, this is system dependant
alias c=clipcopy
alias p=clippaste

## Configuration file aliases
alias sz='source ~/.zshrc'
alias vt='vim ~/.tmux.conf'
alias vv='vim ~/.vimrc'
alias vz='vim ~/.zshrc'

## VLC aliases
alias v='vlc --play-and-exit --fullscreen'
alias vs='vlc --sub-autodetect-file'
alias va='cvlc --play-and-exit'

## Git issue aliases
alias gis='git issue'
alias gia='git issue add'
alias giv='git issue view'
alias gim='git issue mine'
alias giu='git issue update'
alias gicl='git issue close'
alias gimen='git issue mention'

# My completion
zstyle ':completion:*:*:git:*' user-commands issue:'report an issue on github'

# My global variables
# file global alias
PROFILE_FILE='~/.profile'
ZSHRC_FILE='~/.zshrc'
