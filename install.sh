#!/bin/bash
if git --version 2>&1 >/dev/null;
then
    echo "Installing Vundle and Tmux Themepack"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
else 
    echo "Git is not installed, can't continue"
fi

echo "Copying .vimrc and .tmux.conf"
cp .vimrc $HOME/.vimrc
cp .tmux.conf $HOME/.tmux.conf
