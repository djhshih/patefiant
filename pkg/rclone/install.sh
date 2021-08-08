#!/bin/bash
set -ou pipefail

# Prerequisites: - wget

name="rclone"
version=
target_dir=$PATEFIANT_ROOT
package=$name-$version

# download package

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip

# extract files, configure, and compile

dest_dir=$target_dir/bin
install rclone-*-linux-amd64/rclone $dest_dir
