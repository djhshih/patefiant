#!/bin/bash
set -e

# Script for installing tmux and dependencies.
# tmux will be installed in /usr/local/lib by default.

# Prerequisites: - gcc
#                - wget

# define versions

tmux_version="2.0"

libevent_version="2.0.22"
ncurses_version="6.0-20150725"

tmux_name="tmux-$tmux_version"
tmux_relative_url="$tmux_name/$tmux_name"
libevent_name="libevent-$libevent_version"
ncurses_name="ncurses-$ncurses_version"

# set the installation directory

target_dir=$ROOT

# download source files for tmux, libevent, and ncurses
# save them in /tmp

tmp_dir=$(mktemp -d) && cd $tmp_dir && echo $tmp_dir

wget -O ${tmux_name}.tar.gz https://github.com/tmux/tmux/releases/download/${tmux_version}/${tmux_name}.tar.gz
wget -O ${libevent_name}.tar.gz https://github.com/libevent/libevent/releases/download/release-${libevent_version}-stable/${libevent_name}-stable.tar.gz
#wget -O ${ncurses_name}.tar.gz ftp://ftp.gnu.org/gnu/ncurses/${ncurses_name}.tar.gz
wget -O ${ncurses_name}.tar.gz ftp://invisible-island.net/ncurses/current/${ncurses_name}.tgz

# extract files, configure, and compile

# libevent installation
mkdir $libevent_name
tar xzf $libevent_name.tar.gz -C $libevent_name --strip-components=1
cd $libevent_name
./configure --prefix=$tmp_dir --disable-shared
make
make install
cd -

# ncurses installation
mkdir $ncurses_name
tar xzf $ncurses_name.tar.gz -C $ncurses_name --strip-components=1
cd $ncurses_name
./configure --prefix=$target_dir --disable-shared
make
make install
cd -

# tmux installation
mkdir $tmux_name
tar xzf ${tmux_name}.tar.gz -C $tmux_name --strip-components=1
cd $tmux_name
./configure --prefix=$target_dir \
 CFLAGS="-I$tmp_dir/include -I$target_dir/include -I$target_dir/include/ncurses" \
 LDFLAGS="-static -L$tmp_dir/lib -L$target_dir/lib" \
 CPPFLAGS="-I$tmp_dir/include -I$target_dir/include -I$target_dir/include/ncurses"
make
make install
cd -

version=`$target_dir/bin/tmux -V | cut -d ' ' -f 2`
if [ -z "$version" ]; then
  echo 
  echo "[error] failed to install tmux - check for errors in the above output"
  exit 1
fi
