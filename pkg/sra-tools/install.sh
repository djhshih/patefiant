#!/bin/bash

set -euo pipefail

version=current-centos_linux64

#tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir
target_dir=$PATEFIANT_ROOT/opt/sra-tools

mkdir -p $target_dir && cd $target_dir

# Download google cloud sdk install script
curl -O https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.$version.tar.gz
tar -x --strip-components=1 -f sratoolkit.*.gz
rm sratoolkit.*.gz

