#!/bin/bash

set -euo pipefail

localdir=$(dirname "$(readlink -f "$0")")

version=

#tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir
target_dir=$PATEFIANT_ROOT/opt/sra-tools

mkdir -p $target_dir && cd $target_dir

# Download google cloud sdk install script
curl -O https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-centos_linux64.tar.gz
tar -x --strip-components=1 -f sratoolkit.*.gz

