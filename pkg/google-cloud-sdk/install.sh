#!/bin/bash

set -o errexit
set -o nounset

localdir=$(dirname "$(readlink -f "$0")")

version=

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

# Download google cloud sdk install script
curl https://sdk.cloud.google.com > install.sh

bash install.sh --disable-prompts --install-dir=$PATEFIANT_ROOT/opt

