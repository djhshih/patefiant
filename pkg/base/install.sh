#!/bin/bash 
set -o errexit

export ROOT=${ROOT:-$HOME/local}

basepath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $ROOT/{bin,lib,share/man,share/info,opt,java}


cat >>$HOME/.bashrc <<'EOL'

#### BEGIN PATEFIANT ####

if [[ -f $HOME/.patefiant.bashrc ]]; then
	 . $HOME/.patefiant.bashrc
fi

#### END PATEFIANT ####

EOL

cat >$HOME/.patefiant.bashrc <<EOL
export PATEFIANT_ROOT=$ROOT
EOL

cat $basepath/bashrc >>$HOME/.patefiant.bashrc

