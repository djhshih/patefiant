#!/bin/bash
set -o errexit nounset pipefail

homepath="$(readlink -f "$0")"
basepath=${homepath%/*}

# set ROOT to $HOME/local unless already defined
export ROOT=${ROOT:-$HOME/local}
#echo 'export ROOT=$ROOT" >> $HOME/.bashrc

#$basepath/pkg/base/install.sh
#$basepath/pkg/proot/install.sh

sed "s|basepath=.*|basepath=$basepath|" $basepath/bin/fac > $ROOT/bin/fac
chmod +x $ROOT/bin/fac

#. $HOME/.bashrc

