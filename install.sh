#!/bin/bash

#Core packages
sudo apt-get install mc zsh git mercurial vim exuberant-ctags curl wget libcurl4-openssl-dev

#Python Dev Modules
sudo apt-get install python-dev python-setuptools python-virtualenv python3-virtualenv python3-dev python3-setuptools 

#Node
sudo apt-get install npm nodejs nodejs-legacy 

#oh-my-zsh <3 
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#Exit from zsh after install
exit
#Packages for psycopg2 in virtualenv
sudo apt-get install libpq-dev python-dev

#Packages for lxml
sudo apt-get install libxml2-dev libxslt-dev

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

echo "installing fonts at $PWD to ~/.fonts/"
mkdir -p ~/.fonts/adobe-fonts/source-code-pro
git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
# find ~/.fonts/ -iname '*.ttf' -exec echo \{\} \;
fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro
echo "finished installing"
