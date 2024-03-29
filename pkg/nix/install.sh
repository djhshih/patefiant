#!/bin/bash

#set -o errexit
#set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

version=2.12.0
compress=xz

# Download nix

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
wget --no-check-certificate "https://releases.nixos.org/nix/nix-${version}/nix-${version}-${system}.tar.${compress}"
tar -xf nix-*.tar.${compress}
rm nix-*.tar.${compress}
rm -rf nix
mv nix-${version}-* nix

wget -O $PATEFIANT_ROOT/bin/nix-user-chroot https://github.com/nix-community/nix-user-chroot/releases/download/1.1.1/nix-user-chroot-bin-1.1.1-x86_64-unknown-linux-musl
chmod +x $PATEFIANT_ROOT/bin/nix-user-chroot

# Clear system library paths:
# this is important so that /nix/store library paths are used
unset LD_LIBRARY_PATH

# Install Nix using nix-user-chroot
$PATEFIANT_ROOT/bin/nix-user-chroot $PATEFIANT_ROOT/nix bash -c "/nix/install --no-daemon"

# Install nix-user-chroot script with expanded paths
sed "s|\$PATEFIANT_ROOT|$PATEFIANT_ROOT|g;s|\$HOME|$HOME|g" $localdir/nixroot \
    > $PATEFIANT_ROOT/bin/nixroot
chmod +x $PATEFIANT_ROOT/bin/nixroot

