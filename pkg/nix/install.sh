#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

version=2.0.4

# Download nix

case "$(uname -s).$(uname -m)" in
    Linux.x86_64) system=x86_64-linux;; 
    Linux.i?86) system=i686-linux;;
    Darwin.x86_64) system=x86_64-darwin;;
    *) oops "sorry, there is no binary distribution of Nix for your platform";;
esac

cd $PATEFIANT_ROOT
wget --no-check-certificate "https://nixos.org/releases/nix/nix-${version}/nix-${version}-${system}.tar.bz2"
tar -xjf nix-*.tar.bz2
rm nix-*.tar.bz2
mv nix-${version}-* nix

# Install Nix
$PATEFIANT_ROOT/bin/proot -b $PATEFIANT_ROOT/nix:/nix /nix/install

# Install proot script with expanded paths
sed "s|\$PATEFIANT_ROOT|$PATEFIANT_ROOT|g" $localdir/nixroot \
	| sed "s|\$HOME|$HOME|g" \
	> $PATEFIANT_ROOT/bin/nixroot
chmod +x $PATEFIANT_ROOT/bin/nixroot

# Modify .bashrc
if [[ -w $HOME/.bashrc ]]; then

	cat >>$HOME/.bashrc <<-'EOL'

		#### BEGIN NIX ####

		[[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh

		#### END NIX ######

	EOL

else

	cat <<-'EOL'

		You need to add the following to your ~/.bashrc:

		[[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh

	EOL

fi

