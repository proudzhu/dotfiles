#/usr/bin/bash

echo "This will remove all old configs!!!!"

echo "conky config files"
ln -s .conkyrc $HOME/.conkyrc
ln -s .conkyrc_clock $HOME/.conkyrc_clock

echo "vim files"
ln -s .vim $HOME/.vim

echo "zsh files"
ln -s .zsh $HOME/.zsh
