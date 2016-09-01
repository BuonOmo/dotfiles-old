# Path to your oh-my-zsh installation.
  export ZSH=/home/ulysse/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

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
plugins=(git catimg chucknorris common-aliases web-search)

# User configuration

  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/ulysse/npm/bin"
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
## Mutt
export EMAIL=buonomo.ulysse@gmail.com


# My functions (in ~/oh-my-zsh/functions)
autoload -Uz cdtp
autoload -Uz cdpr
autoload -Uz hy
autoload -Uz e


# My aliases

## basic term functions modifications
alias du='du -h' # rend du plus agréable à la lecture
alias dus='du -h --summarize' # rend du plus agréable à la lecture
alias la='ls -la'
alias l='ls -lAFh'
alias diff='colordiff' # plus de couleurs pour diff
alias rehash='rehash;source ~/.zshrc'
alias irb='irb --simple-prompt'
alias catcolor='rougify' # add color for code elements

## launchers
alias neo4j='./Documents/neo4j/neo4j-community-2.3.2/bin/neo4j start'
alias nikto='perl ~/Programmes/nikto/program/nikto.pl' # Test de défaillances de sites web
alias ascacou='cdpr ascacou;gco -q electron;npm start > /dev/null &;cd -1'

## easter eggs
alias hodor="vlc --fullscreen --play-and-exit --start-time=3210 --stop-time=3216 Vidéos/Séries/Game\ of\ Thrones/S6/Game.of.Thrones.S06E05.PROPER.VOSTFR.1080p.HDTV.DD5.1.x265-exPM5.mkv 2> /dev/null"
alias starwars='telnet towel.blinkenlights.nl'

alias laptop-mode='cd /etc/laptop-mode/conf.d'
alias internet='if ! ping -c 1 google.com > /dev/null;then echo "pas de connection internet.";fi'
alias atoms='atom --safe'
alias cpv='rsync -ah --progress'
# pdfcompress : la sortie est redirigée vers la sortie standard, penser à faire 'pdfcompress old.pdf > new.pdf'
# -dPDFSETTINGS="/screen|/ebook|/printer|/prepress" (valeur de la - bonne à la meilleure) - n’est pas necessaire
alias pdfcompress='gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS="/screen" -sOutputFile=-'
alias freebox='gvfs-mount smb://mafreebox.freebox.fr/Disque dur/'
alias sshinsa='ssh iftpserv2.insa-lyon.fr -l ubuonomo'
alias jdo='less JustDoIt'

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

## Alias pour apt
alias aptu='sudo apt-get update'
alias apti='sudo apt-get install'
alias aptr='sudo apt-get remove'
alias aptar='sudo apt-get autoremove'

## Alias pour l’utilisation du msp430
alias msp-as='msp430-as -mmcu=msp430fg4618'
alias msp-gcc='msp430-gcc -mmcu=msp430fg4618 -Wall -Werror -01 -c'
alias msp-edl='msp430-gcc -mmcu=msp430fg4618 -mdisable-watchdog -o exe.elf'
alias mspdebug='sudo mspdebug -j -d /dev/ttyUSB0 uif'

# Alias de configurations système
alias night='xbacklight -set 3'
alias day='xbacklight -set 90'
alias up='sudo su -c "echo 1 > /sys/class/leds/asus::kbd_backlight/brightness"'
alias down='sudo su -c "echo 0 > /sys/class/leds/asus::kbd_backlight/brightness"'
alias toggle='[[ "$(cat /sys/class/leds/asus::kbd_backlight/brightness)" == "0" ]] && up || down'

# My completion
zstyle ':completion:*:*:git:*' user-commands issue:'report an issue on github'
source ~/.oh-my-zsh/completions/npm

# Nice drawing
echo
fortune literature | cowsay -W 80 -f $(cowthink -l | tail -n +2 | tr '\n' ' ' | cut -d " " -f$(($RANDOM % 51 + 1)))
