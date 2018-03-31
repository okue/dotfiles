#! /bin/bash

ln -s ~/dotfiles/.vim          ~/.vim
rm ~/.vim/.vim

ln -s ~/dotfiles/.vimrc        ~/.vimrc
ln -s ~/dotfiles/.inputrc      ~/.inputrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.bash-completion-files ~/.bash-completion-files
rm ~/.bash-completion-files/.bash-completion-files
