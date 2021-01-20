#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

version=2.3.10

# Download nix

case "$(uname -s).$(uname -m)" in
    Linux.x86_64) system=x86_64-linux;; 
    Linux.i?86) system=i686-linux;;
    Darwin.x86_64) system=x86_64-darwin;;
    *) oops "sorry, there is no binary distribution of Nix for your platform";;
esac

case "$(uname -s).$(uname -m)" in
    Linux.x86_64) system=x86_64-linux;;
    Linux.i?86) system=i686-linux;;
    Linux.aarch64) system=aarch64-linux;;
    Darwin.x86_64) system=x86_64-darwin;;
    # eventually maybe: system=arm64-darwin;;
    Darwin.arm64) system=x86_64-darwin;;
    *) oops "sorry, there is no binary distribution of Nix for your platform";;
esac

cd $PATEFIANT_ROOT
wget --no-check-certificate "https://releases.nixos.org/nix/nix-${version}/nix-${version}-${system}.tar.xz"
tar -xJf nix-*.tar.xz
rm nix-*.tar.xz
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

