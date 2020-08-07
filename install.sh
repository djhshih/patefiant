#!/bin/bash
set -euo pipefail

basepath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# set DESTDIR to $HOME/local unless already defined
export DESTDIR=${DESTDIR:-$HOME/local}

$basepath/pkg/base/install.sh

sed "s|basepath=.*|basepath=$basepath|" $basepath/bin/fac > $DESTDIR/bin/fac
chmod +x $DESTDIR/bin/fac

sed "s|\$HOME|$HOME|g" $basepath/bin/patenv > $DESTDIR/bin/patenv
chmod +x $DESTDIR/bin/patenv

echo "Installation is complete, but you may need to modify your ~/.bashrc"

