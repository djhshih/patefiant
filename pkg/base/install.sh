#!/bin/bash 
set -o errexit nounset pipefail

mkdir -p $ROOT/{bin,lib,share/man,share/info}

echo 'export PATH=$ROOT/bin:$PATH' >> $HOME/.bashrc
echo 'export LD_LIBRARY_PATH=$ROOT/lib:$LD_LIBRARY_PATH' >> $HOME/.bashrc
echo 'export MANPATH=$ROOT/share/man:$MANPATH' >> $HOME/.bashrc
echo 'export INFOPATH=$ROOT/share/info:$INFOPATH' >> $HOME/.bashrc

