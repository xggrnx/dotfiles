#!/bin/bash

sudo apt-get install mc zsh git mercurial python-dev python-setuptools python-virtualenv python3-virtualenv python3-dev python3-setuptools npm nodejs nodejs-legacy 

#oh-my-zsh <3 
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Packages for psycopg2 in virtualenv
sudo apt-get install libpq-dev python-dev

#Packages for Pillow in virtualenv
sudo apt-get install libjpeg8 libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev

cd ~/src/

ln -s ~/src/dotfiles/vimrc ~/.vimrc
ln -s ~/src/dotfiles/vim ~/.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

git clone https://github.com/powerline/fonts.git
cd ~/src/fonts
sh install.sh


