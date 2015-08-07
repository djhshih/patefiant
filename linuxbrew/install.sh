#!/bin/bash
set -e

# Install linuxbrew

# Prerequisites: - ruby
#                - curl

name="linuxbrew"

# download and install

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"

# edit .bashrc

echo "export PATH=$HOME/.linuxbrew/bin:$PATH" >> $HOME/.bashrc
echo "export MANPATH=$HOME/.linuxbrew/share/man:$MANPATH" >> $HOME/.bashrc
echo "export INFOPATH=$HOME/.linuxbrew/share/info:$INFOPATH" >> $HOME/.bashrc

. $HOME/.bashrc
