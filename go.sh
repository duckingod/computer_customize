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

if [ -f "aalready_did" ]; then
    echo "You already go-ed, run again is not recommended."
    echo "Delete file './already_did' to force runing."
    exit
fi
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
if [ "`uname`" == "Linux" ]; then
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install `cat files/apt-get-list`
fi

while read p; do 
    al=$(echo $p | cut -f1 -d\;)
    cmd=$(echo $p | cut -f2 -d\;)
    git config --global $al "$cmd"
done < files/gitconfig

