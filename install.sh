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
ln -i zshrc ~/.zshrc
ln -i vimrc ~/.vimrc
ln -i vim ~/.vim
ln -i .tmux.conf ~/.tmux.conf
ln -i functions/* ~/.oh-my-zsh/functions/
find vim/* -exec ln -i {} ~/.{} \;
echo Restart your terminal to finish installation

