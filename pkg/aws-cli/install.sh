#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

version=

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# Download google cloud sdk install script
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "aws.zip"
unzip aws.zip

bash ./aws/install -i $PATEFIANT_ROOT/opt -b $PATEFIANT_ROOT/bin

