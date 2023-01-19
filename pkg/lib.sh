#!/bin/bash
# Common functions

set -euo pipefail
IFS=$'\n\t'

_init() {
	local_dir=$(dirname "$(readlink -f "$0")")
	tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir
}

