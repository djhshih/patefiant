#!/bin/bash
set -eou pipefail

localdir=$(dirname "$(readlink -f "$0")")

name=nextflow
version=latest
arch=$(uname -m)
url=https://get.nextflow.io
target_dir=$PATEFIANT_ROOT

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

curl -o nextflow -L $url
bash nextflow
chmod +x nextflow
mv nextflow $target_dir/bin

cd -

