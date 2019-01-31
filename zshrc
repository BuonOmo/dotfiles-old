cat ~/.notes
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

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
plugins=(zsh-autosuggestions git gitignore zsh-better-npm-completion common-aliases archlinux)

# User configuration

export PATH="$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/ulysse/npm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# My exports
export EDITOR=/usr/bin/vim


# My functions (in ~/oh-my-zsh/functions)
autoload -Uz hy

# My aliases

## basic term functions modifications
alias du='du -h' # rend du plus agréable à la lecture
alias dus='du -h --summarize' # rend du plus agréable à la lecture
alias la='ls -la'
alias l='ls -lAFh'
alias vdiff='vimdiff'
alias rehash='rehash;source ~/.zshrc'
alias irb='irb --simple-prompt'
alias catcolor='rougify' # add color for code elements
alias rm='/bin/rm -I --preserve-root'
alias :q=exit

## launchers
alias neo4j='./Documents/neo4j/neo4j-community-2.3.2/bin/neo4j start'
alias nikto='perl ~/Programmes/nikto/program/nikto.pl' # Test de défaillances de sites web
alias ascacou='cdpr ascacou;gco -q electron;npm start > /dev/null &;cd -1'

## easter eggs
alias starwars='telnet towel.blinkenlights.nl'

alias laptop-mode='cd /etc/laptop-mode/conf.d'
alias internet='if ! ping -c 1 google.com > /dev/null;then echo "pas de connection internet.";fi'
alias atoms='atom --safe'
alias cpv='rsync -ah --progress'
# pdfcompress : la sortie est redirigée vers la sortie standard, penser à faire 'pdfcompress old.pdf > new.pdf'
# -dPDFSETTINGS="/screen|/ebook|/printer|/prepress" (valeur de la - bonne à la meilleure) - n’est pas necessaire
alias pdfcompress='gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS="/screen" -sOutputFile=-'
alias sshinsa='ssh iftpserv2.insa-lyon.fr -l ubuonomo'
alias jdo='less JustDoIt'
alias te='rm $alias_tmp && unset alias_tmp && alias_tmp=$(mktemp "ulysse-$(whoami)-$(date +%A-%HH).XXX.tmp")'
alias vite='vi $alias_tmp'

## Alias globaux
alias -g T='$(echo $alias_tmp || alias_tmp=$(mktemp "ulysse-$(whoami)-$(date +%A-%HH).XXX.tmp") && echo $alias_tmp)'
alias -g PO='&& poweroff'

## Alias pour le clipboard
alias c=clipcopy
alias p=clippaste

## Alias pour ecrire rapidement dans les fichiers de configuration
alias vb='vim ~/.bashrc'
alias vz='vim ~/.zshrc'
alias vv='vim ~/.vimrc'
alias vt='vim ~/.tmux.conf'

## Alias pour vlc
alias v='vlc --play-and-exit --fullscreen'
alias vs='vlc --sub-autodetect-file'
alias va='cvlc --play-and-exit'

# GIt aliases
alias gpf='git push --force-with-lease'
alias gapan='git add --intent-to-add . && git add --patch'

# My completion
zstyle ':completion:*:*:git:*' user-commands issue:'report an issue on github'

setopt extendedglob
