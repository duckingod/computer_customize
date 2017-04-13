#!/usr/bin/env bash

# Get bashrc path
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

