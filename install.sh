#!/bin/bash
set -euo pipefail

. pkg/lib.sh

basepath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# set DESTDIR to $HOME/local unless already defined
export ROOT=${DESTDIR:-$HOME/local}

$basepath/pkg/base/install.sh

_def_var basepath $basepath $basepath/bin/fac > $ROOT/bin/fac
chmod +x $ROOT/bin/fac

_set_var HOME $HOME $basepath/bin/patenv > $ROOT/bin/patenv
chmod +x $ROOT/bin/patenv

echo "Installation is complete."

