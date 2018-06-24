#!/bin/bash
set -euo pipefail

basepath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

name=enaget
version=1.5.1
release=python3
target=$PATEFIANT_ROOT

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

mkdir -p $target/opt/$name
wget -O ${version}.tar.gz https://github.com/enasequence/enaBrowserTools/archive/v${version}.tar.gz
tar -xzf ${version}.tar.gz -C $target/opt/$name --strip-components=1

rm -rf $target/opt/$name/aspera_settings.ini
# make new aspera setting configuration
mkdir -p $target/opt/$name/etc
sed "s|\$HOME|$HOME|g" $basepath/aspera.ini > $target/opt/$name/etc/aspera.ini

# install execution scripts

sed "s|\$ENAGET_ROOT|$target/opt/$name|g" $basepath/enaget \
	> $target/bin/enaget
chmod +x $target/bin/enaget

sed "s|\$ENAGET_ROOT|$target/opt/$name|g" $basepath/enadget \
	> $target/bin/enadget
chmod +x $target/bin/enadget

