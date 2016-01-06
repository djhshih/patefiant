#!/bin/bash 
set -o errexit

mkdir -p $ROOT/{bin,lib,share/man,share/info,opt}

cat >>$HOME/.bashrc <<'EOL'

#### BEGIN PATEFIANT ####

# compile time environmental variables
export CPATH='$ROOT/include:$CPATH'
export LIBRARY_PATH='$ROOT/lib:$LIBRARY_PATH'

# run time environmental variables
export PATH='$ROOT/bin:$PATH >> $HOME/.bashrc'
export LD_LIBRARY_PATH='$ROOT/lib:$LD_LIBRARY_PATH'
export MANPATH='$ROOT/share/man:$MANPATH'
export INFOPATH='$ROOT/share/info:$INFOPATH'

LPATH=''
for pkg in $ROOT/opt/*; do
	if [[ -d $pkg/bin ]]; then
		LPATH+=:$pkg/bin
	else
		LPATH+=:$pkg
	fi
done
export PATH+=:$LPATH

#### END PATEFIANT ####

EOL

