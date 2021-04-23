#!/bin/bash
set -eou pipefail

name=gdc-client
version=1.6.0
suffix="-py3.7_0"
url=https://gdc.cancer.gov/files/public/file/

case "$(uname -s)" in
	Linux*)     platform=Ubuntu;;
	Darwin*)    platform=OSX;;
	*)          platform=;;
esac 

if [[ -z $platform ]]; then
	echo "Unsupported platform"
	exit 1
fi

target_dir=$PATEFIANT_ROOT

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

curl -o $name.zip $url/${name}_v${version}_${platform}_x64${suffix}.zip
unzip $name.zip -d $target_dir/bin

cd -
