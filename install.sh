set -e
INSTALL=${INSTALL:-sudo pacman -S}
INSTALL_TMUX=${INSTALL_TMUX:-false}

error() {
  >&2 echo "$0: $1"
  false
}

write() {
  size=${#1}
  [ $size -gt "94" ] && error "log too long"

  no_color='\033[0m'
  printf ${2:-$no_color}
  printf '@%.0s' {1..100}
  printf '\n'
  adjust=$(( (100 - 6) / 2))
  printf '@@ %*s' $adjust "$1"
  printf '%*s @@\n' $adjust ''
  # printf '%*s @@\n' 94 $1
  printf '@%.0s' {1..100}
  printf '\n'
  printf $no_color
}

log() {
  write "$@"
}

warn() {
  red='\033[0;31m'
  write "$@" $red
}

default_install() {
  command -v $1 > /dev/null \
    || (log "Installing $1" && $INSTALL $1)
}

default_install zsh
default_install git
default_install vim
default_install autojump
$INSTALL_TMUX && default_install tmux

[ -f ".font-powerline-installed.local" ] \
  || (
    log "Installing fonts-powerline"
    $INSTALL fonts-powerline || (
      log "Installing powerline fonts the hard way"
      # clone
      git clone https://github.com/powerline/fonts.git --depth=1
      # install
      cd fonts
      ./install.sh
      # clean-up a bit
      cd ..
      rm -rf fonts
    )
    touch ".font-powerline-installed.local"
  )

[ -d ~/.oh-my-zsh ] \
  || (
    log "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  )

vim --version | grep +clipboard > /dev/null \
  || log "Your vim version doesn't support copy pasting"

log "Installing dotfiles"
(
  ln -i zshrc ~/.zshrc
  ln -i vimrc ~/.vimrc
  ln -i gitconfig ~/.gitconfig
  ln -i gitignore ~/.gitignore
  cp vim ~/.vim
  ln -i tmux.conf ~/.tmux.conf
  mkdir -p ~/.oh-my-zsh/functions/
  ln -i functions/* ~/.oh-my-zsh/functions/
  find vim/* -type f -exec ln -i {} ~/.{} \;
) || true

[ -d ~/.vim/bundle/Vundle.vim ] \
  || (
    log "Installing Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
  )

echo
echo Restart your terminal to finish installation.
