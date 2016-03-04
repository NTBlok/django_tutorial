#! /bin/sh

# Update
sudo apt-get update

# Curl
sudo apt-get install -y curl

# Pip
sudo apt-get install python-pip
# Virtualenv
sudo apt-get install python-virtualenv
# Awsebcli
sudo pip install awsebcli

# Ipython
sudo apt-get install ipython ipython3

# Django
sudo pip install Django==1.9.2
# DjangoRestFramework
sudo pip install djangorestframework
sudo pip install markdown
sudo pip install django-filter


# Tree
sudo apt-get install tree

# Vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Build .vimrc
if [ -e ~/.vimrc ]; then mv ~/.vimrc ~/.vimrc_bak; fi
echo "set nocompatible"             >> ~/.vimrc
echo "filetype plugin indent off"       >> ~/.vimrc
echo "syntax off"               >> ~/.vimrc
echo "set rtp+=~/.vim/bundle/Vundle.vim"    >> ~/.vimrc
echo "call vundle#begin()"          >> ~/.vimrc
echo "Plugin 'gmarik/Vundle.vim'"       >> ~/.vimrc
echo "Plugin 'The-NERD-tree'"           >> ~/.vimrc
echo "Plugin 'mxw/vim-jsx'"         >> ~/.vimrc
echo "Plugin 'davidhalter/jedi-vim'"        >> ~/.vimrc
echo "Plugin 'majutsushi/tagbar'"       >> ~/.vimrc
echo "Plugin 'pangloss/vim-javascript'"     >> ~/.vimrc
echo "call vundle#end()"            >> ~/.vimrc
echo "filetype plugin indent on"        >> ~/.vimrc
echo "syntax on"                >> ~/.vimrc
echo "let g:jsx_ext_required = 0"       >> ~/.vimrc
echo "let python_highlight_all = 1"         >> ~/.vimrc
echo "set number"               >> ~/.vimrc
echo "set ts=4"                 >> ~/.vimrc
echo "set autoindent"               >> ~/.vimrc
echo "set expandtab"                >> ~/.vimrc
echo "set shiftwidth=4"             >> ~/.vimrc
echo "set cursorline"               >> ~/.vimrc
echo "set showmatch"                >> ~/.vimrc
# To Finish Vim Plugin Installation, Run :PluginInstall inside vim

# Dotfiles
git clone https://github.com/startup-class/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .

