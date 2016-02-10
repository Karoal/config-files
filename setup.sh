#!/bin/sh
# Install script for my dotfiles. Not everything might be set up correcly!
VIMCONFIG=".vimrc"
XRESCONFIG=".Xresources"

function copy {
        if [ -s ~/$1 ]
        then
            echo "Moving ~/$1 to ~/$1.bak"
            mv ~/$1 ~/$1.bak
        fi

        echo "Copying $1"
        cp $1 ~/$1
}

copy $VIMCONFIG
copy $XRESCONFIG
