#!/bin/bash

#### setup for vim ####

# update vimrc
cp vimrc ~/.vimrc
mkdir ~/.vim-backup

pwd = $(pwd)

# install pathogen to manage plugins
cd ~
mkdir -p .vim/{autoload,bundle}
cd .vim
git clone https://github.com/tpope/vim-pathogen.git
cp vim-pathogen/autoload/pathogen.vim autoload

# solarized theme
cd ~/.vim/bundle
git clone https://github.com/altercation/vim-colors-solarized.git

# airline 
cd ~/.vim/bundle
git clone https://github.com/bling/vim-airline
sudo apt-get install fonts-powerline

# NERD Tree
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree

# vimcdoc 
cd ~/.vim/bundle
git clone https://github.com/asins/vimcdoc.git
# in vim : :helptags ~/.vim/bundle/vimcdoc/doc

# indentLine
cd ~/.vim/bundle
git clone https://github.com/Yggdroot/indentLine

# python syntax check and many other syntax checkers 
sudo apt-get install pyflakes
cd ~/.vim/bundle
# scrooloose/syntastic has many many checkers, it is very powerful
git clone https://github.com/scrooloose/syntastic

# autocomplete: YouCompleteMe
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe
cd YouCompleteMe
# download third party source 
git submodule update --init --recursive 
# compile source code for complete engine
# with support for C-family and Golang
./install.py --clang-completer --gocode-completer

# delimitmate: auto complete for quotes, parens, brackets, etc.
cd ~/.vim/bundle
git clone https://github.com/raimondi/delimitmate

cd $pwd

# vim solarized theme may not work fine in tmux
# if use tmux, please add below line in .profile or . bashrc:
#    alias tmux="TERM=screen-256color-bce tmux"
# this will fix vim color theme in tmux

