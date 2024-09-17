#!/bin/bash
set -eou pipefail

localdir=$(dirname "$(readlink -f "$0")")

name=micromamba
version=latest
arch=$(uname -m)
url=https://micro.mamba.pm/install.sh

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

curl -o installer.sh -L $url
# TODO modify default paths in installer.
bash installer.sh

# Install bashrc with expanded paths
sed "s|\$PATEFIANT_ROOT|$PATEFIANT_ROOT|g;s|\$HOME|$HOME|g" $localdir/bashrc \
	> $HOME/.mamba.bashrc

cd -

