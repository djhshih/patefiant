#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

# Download nix
version=1.11.2-x86_64-linux
cd $PATEFIANT_ROOT
wget http://hydra.nixos.org/build/33550003/download/1/nix-${version}.tar.bz2
tar -xjf nix-*.tar.bz2
rm nix-*.tar.bz2
mv nix-${version} nix

# Install Nix
$PATEFIANT_ROOT/bin/proot -b $PATEFIANT_ROOT/nix:/nix /nix/install

# Install proot script
install $localdir/nixroot $PATEFIANT_ROOT/bin

# Modify .bashrc
echo 'if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi' >> $HOME/.bashrc
