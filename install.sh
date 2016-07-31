echo "You first need to install:
- zsh
- oh-my-zsh
- powerfonts for oh my zsh
- tmux
- vim (vim-gnome edition is the best for copy pasting)"
read Continue installation (Y/n)? yn
if test $yn = "n" || test $yn = "N";then
	exit 1
fi
echo Copying files
cp -v .zshrc ~/.zshrc
cp -v .vimrc ~/.vimrc
cp -v .tmux.conf ~/.tmux.conf
cp -v functions/* ~/.oh-my-zsh/functions/

echo Restart your terminal to finish installation

