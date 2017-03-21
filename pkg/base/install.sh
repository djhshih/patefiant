#!/bin/bash 
set -o errexit

export ROOT=${ROOT:-$HOME/local}

basepath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $ROOT/{bin,lib,share/man,share/info,opt}

if [[ -w $HOME/.bashrc ]]; then
# .bashrc is writable: automatically write the required configuration

	cat >>$HOME/.bashrc <<-'EOL'

		#### BEGIN PATEFIANT ####

		[[ -f $HOME/.patefiant.bashrc ]] && . $HOME/.patefiant.bashrc

		#### END PATEFIANT ######

	EOL

else

	cat <<-'EOL'

		You need to add the following to your ~/.bashrc:

		[[ -f $HOME/.patefiant.bashrc ]] && . $HOME/.patefiant.bashrc

	EOL

fi

cat >$HOME/.patefiant.bashrc <<-EOL
	export PATEFIANT_ROOT=$ROOT
EOL

cat $basepath/bashrc >>$HOME/.patefiant.bashrc

