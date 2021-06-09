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

    echo "configure bashrc ..."
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
    
    echo "configure screen ..."
    cat files/screenrc >> ~/.screenrc
    if [ "`uname`" == "Darwin" ]; then
        # screen only load .bashrc in OSX
        cat files/bashrc_append >> ~/.bashrc
    fi

    echo "configure colorful tmux ..."
    cp files/tmux.conf ~/.tmux.conf
fi


echo "configure gitconfig ..."
while read p; do 
    al=$(echo $p | cut -f1 -d\;)
    cmd=$(echo $p | cut -f2 -d\;)
    git config --global $al "$cmd"
done < files/gitconfig


