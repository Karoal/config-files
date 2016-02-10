#!/bin/sh
# Install script for my dotfiles. Not everything might be set up correcly!

if [ -s ~/.vimrc ]
then
    echo "Moving ~/.vimrc to ~/.vimrc.bak"
    mv ~/.vimrc ~/.vimrc.bak
fi

echo "Copying .vimrc"
cp .vimrc ~/.vimrc
