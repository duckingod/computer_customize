#!/usr/bin/env bash

# get bashrc path
if [ "`uname`" == "Linux" ]; then
    bashrc=~/.bashrc
    bashrc_local_os=files/bashrc.local.linux
elif [ "`uname`" == "Darwin" ]; then
    bashrc=~/.bash_profile
    bashrc_local_os=files/bashrc.local.darwin
else
    echo "Unsupported OS: `uname`"
    exit
fi

if [ -f "already_did" ]; then
    echo "You already go-ed, will execute part of functions only."
    echo "Delete file './already_did' to force running all functions."
    echo
else
    touch already_did

    bashrc_local=~/.bashrc.local

    # make bashrc source ~/.bashrc.local
    if ! [ -f "$bashrc" ]; then
        touch $bashrc
    fi
    cp $bashrc $bashrc.backup
    cat files/bashrc_append >> $bashrc
    cp files/bashrc.local $bashrc_local
    cat $bashrc_local_os >> $bashrc_local
    . $bashrc_local
    # install packages for ubuntu
    echo "install packages ..."
    if [ "`uname`" == "Linux" ]; then
        sudo apt-get update
        sudo apt-get upgrade
        sudo apt-get install `cat files/apt-get-list`
    fi
fi



echo "configure gitconfig ..."
while read p; do 
    al=$(echo $p | cut -f1 -d\;)
    cmd=$(echo $p | cut -f2 -d\;)
    git config --global $al "$cmd"
done < files/gitconfig

echo "copy commands ..."
if [ ! -d "$HOME/.script" ]; then
    mkdir ~/.script
fi
cp script/* ~/.script/

echo "configure vim ..."
cp ~/.vimrc ~/.vimrc.backup
cat files/vimrc >> ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.vundle.vimrc ~/.vundle.vimrc.backup
cat files/vundle.vimrc >> ~/.vundle.vimrc
echo "  (YouCompleteMe not install by default)"


echo "configure python ..."
pip install virtualenv

