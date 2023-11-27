#!/bin/bash
set -euo pipefail

basepath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# set DESTDIR to $HOME/local unless already defined
export ROOT=${DESTDIR:-$HOME/local}

$basepath/pkg/base/install.sh

sed "s|basepath=.*|basepath=$basepath|" $basepath/bin/fac > $ROOT/bin/fac
chmod +x $ROOT/bin/fac

sed "s|\$HOME|$HOME|g" $basepath/bin/patenv > $ROOT/bin/patenv
chmod +x $ROOT/bin/patenv

echo "Installation is complete."

