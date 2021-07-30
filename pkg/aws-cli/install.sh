#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

version=

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# Download google cloud sdk install script
curl https://sdk.cloud.google.com > install.sh
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

bash ./aws/install -i $PATEFIANT_ROOT/opt -b $PATIEFIANT_ROOT/bin

