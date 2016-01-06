#!/bin/bash 
set -o errexit
set -o nounset

mkdir -p $ROOT/{bin,lib,share/man,share/info}

echo 'export CPATH=$ROOT/include:$CPATH' >> $HOME/.bashrc 
echo 'export LIBRARY_PATH=$ROOT/lib:$LIBRARY_PATH' >> $HOME/.bashrc
echo 'export PATH=$ROOT/bin:$PATH' >> $HOME/.bashrc
echo 'export LD_LIBRARY_PATH=$ROOT/lib:$LD_LIBRARY_PATH' >> $HOME/.bashrc
echo 'export MANPATH=$ROOT/share/man:$MANPATH' >> $HOME/.bashrc
echo 'export INFOPATH=$ROOT/share/info:$INFOPATH' >> $HOME/.bashrc

