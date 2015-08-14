localdir=$(dirname "$(readlink -f "$0")")

ARCH_ROOT=$HOME/arch
SRC=root.x86_64

tmpdir=$(mktemp -d) && cd $tmpdir
curl -O https://mirrors.kernel.org/archlinux/iso/2015.06.01/archlinux-bootstrap-2015.06.01-x86_64.tar.gz
tar -xzf archlinux-bootstrap-2015.06.01-x86_64.tar.gz

sed -e 's/SigLevel.*Required.*$/SigLevel = Never/g' $SRC/etc/pacman.conf > $ARCH_ROOT/etc/pacman.d/

mkdir -p $ARCH_ROOT/etc/pacman.d/
cp $SRC/etc/pacman.d/mirrorlist $ARCH_ROOT/etc/pacman.d/mirrorlist.pacman
echo 'Server = http://mirror.us.leaseweb.net/archlinux/$repo/os/$arch' > $ARCH_ROOT/etc/pacman.d/mirrorlist

mkdir -p $ARCH_ROOT/var/{cache/pacman/pkg,lib/pacman}
install_pacman='pacman -r $ARCH_ROOT --cacheddir $ARCH_ROOT/var/cache/pacman/pkg --config $ARCH_ROOT/etc/pacman.conf'
proot -S $SRC $install_pacman

proot -S $ARCH_ROOT pacman -Syu

# Modify .bashrc
echo "export ARCH_ROOT=$ARCH_ROOT" >> $HOME/.bashrc

# Install proot script
install $localdir/archroot $ROOT/bin
