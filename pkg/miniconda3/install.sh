#!/bin/bash
set -eou pipefail

localdir=$(dirname "$(readlink -f "$0")")

name=miniconda
version=latest
arch=$(uname -m)
url=https://repo.anaconda.com/miniconda

case "$(uname -s)" in
	Linux*)     platform=Linux;;
	Darwin*)    platform=MacOSX;;
	*)          platform=;;
esac 

if [[ -z $platform ]]; then
	echo "Unsupported platform"
	exit 1
fi

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

curl -o installer.sh $url/Miniconda3-${version}-${platform}-${arch}.sh
bash installer.sh

# Install bashrc with expanded paths
sed "s|\$PATEFIANT_ROOT|$PATEFIANT_ROOT|g" $localdir/bashrc |
	sed "s|\$HOME|$HOME|g" \
	> $HOME/.miniconda3.bashrc

cd -

