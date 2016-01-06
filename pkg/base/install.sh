#!/bin/bash 
set -o errexit

mkdir -p $ROOT/{bin,lib,share/man,share/info,opt}


cat >>$HOME/.bashrc <<EOL

#### BEGIN PATEFIANT ####

export ROOT=$ROOT
EOL

cat >>$HOME/.bashrc <<'EOL'

# compile time environmental variables
export CPATH=$ROOT/include:$CPATH
export LIBRARY_PATH=$ROOT/lib:$LIBRARY_PATH

# run time environmental variables
export PATH=$ROOT/bin:$PATH
export LD_LIBRARY_PATH=$ROOT/lib:$LD_LIBRARY_PATH
export MANPATH=$ROOT/share/man:$MANPATH
export INFOPATH=$ROOT/share/info:$INFOPATH

if [ $(ls -A $ROOT/opt) ]; then
	LPATH=''
	for pkg in $ROOT/opt/*; do
		if [[ -d $pkg/bin ]]; then
			LPATH+=:$pkg/bin
		else
			LPATH+=:$pkg
		fi
	done
	export PATH=$PATH:$LPATH
fi

#### END PATEFIANT ####

EOL

