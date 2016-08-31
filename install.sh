echo "You first need to install:
- zsh
- oh-my-zsh
- powerfonts for oh my zsh
- tmux
- vim (vim-gnome edition is the best for copy pasting)"
# sudo apt-get install vim-gnome tmux zsh xclip
#read "Continue installation (Y/n)?" yn
#if test $yn = "n" || test $yn = "N";then
#	exit 1
#fi
echo Copying files
cp -fvl .zshrc ~/.zshrc
cp -fvl .vimrc ~/.vimrc
cp -fvl .tmux.conf ~/.tmux.conf
cp -fvl functions/* ~/.oh-my-zsh/functions/

echo Restart your terminal to finish installation

