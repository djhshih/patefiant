#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

version=1.11.5

# Download nix

case "$(uname -s).$(uname -m)" in
    Linux.x86_64) system=x86_64-linux;; 
    Linux.i?86) system=i686-linux;;
    Darwin.x86_64) system=x86_64-darwin;;
    *) oops "sorry, there is no binary distribution of Nix for your platform";;
esac

version=1.11.2-x86_64-linux
cd $PATEFIANT_ROOT
wget https://nixos.org/releases/nix/nix-${version}/nix-${version}-${system}.tar.bz2"
tar -xjf nix-*.tar.bz2
rm nix-*.tar.bz2
mv nix-${version} nix

# Install Nix
$PATEFIANT_ROOT/bin/proot -b $PATEFIANT_ROOT/nix:/nix /nix/install

# Install proot script
install $localdir/nixroot $PATEFIANT_ROOT/bin

# Modify .bashrc
cat >>$HOME/.bashrc <'EOL'

#### BEGIN NIX ####

[[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh

#### END NIX ######

EOL

