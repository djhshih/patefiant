localdir=$(dirname "$(readlink -f "$0")")

# Download nix
version=1.9-x86_64-linux
cd $ROOT
wget http://hydra.nixos.org/build/23017494/download/1/nix-${version}.tar.bz2
tar -xjf nix-*.tar.bz2
rm nix-*.tar.bz2
mv nix-${version} nix

# Install Nix
$ROOT/bin/proot -b $ROOT/nix:/nix /nix/install

# Install proot script
install $localdir/nixroot $ROOT/bin

# Modify .bashrc
echo 'if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi' >> $HOME/.bashrc
