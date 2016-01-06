#!/bin/bash
set -o errexit
set -o nounset

homepath="$(readlink -f "$0")"
basepath=${homepath%/*}

# set ROOT to $HOME/local unless already defined
export ROOT=${ROOT:-$HOME/local}

#$basepath/pkg/base/install.sh
#$basepath/pkg/proot/install.sh

sed "s|basepath=.*|basepath=$basepath|" $basepath/bin/fac > $ROOT/bin/fac
chmod +x $ROOT/bin/fac

fac install base

. $HOME/.bashrc

