#!/bin/bash
set -eou pipefail

name=miniconda
version=latest
arch=x86_64
url=https://repo.continuum.io/miniconda

case "$(uname -s)" in
	Linux*)     platform=Ubuntu;;
	Darwin*)    platform=OSX;;
	*)          platform=;;
esac 

if [[ -z $platform ]]; then
	echo "Unsupported platform"
	exit 1
fi

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

curl -o installer.sh $url/Miniconda3-${version}-${platform}-${arch}.sh
chmod +x installer.sh
./installer.sh

cd -

