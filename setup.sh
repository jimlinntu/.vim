#!/usr/bin/env bash
echo 'Are you going to append `export TERM=screen-256color` at the end of ~/.bashrc?'
echo 'y for yes, n for no'
read confirm
if [[ $confirm == 'y' ]]; then
    echo 'export TERM=xterm-256color' >> ~/.bashrc
fi


echo 'Are you going to set vim as your git commit editor in ~/.bashrc?'
echo 'y for yes, n for no'
read confirm
if [[ $confirm == 'y' ]]; then
    echo -e 'export VISUAL=vim\nexport EDITOR="$VISUAL"' >> ~/.bashrc
fi
echo '[*] Remember to source ~/.bashrc before you do next things!'
