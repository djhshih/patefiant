#!/bin/bash

version=latest
platform=Linux
arch=x86_64

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget -O installer.sh https://repo.continuum.io/miniconda/Miniconda3-${version}-${platform}-${arch}.sh
chmod +x installer.sh
./installer.sh

cd -
