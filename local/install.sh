# define ROOT unless previously defined
export ROOT=${ROOT:-$HOME/local}

mkdir -p $ROOT/{bin,lib,share/man,share/info}

echo 'export ROOT=$ROOT' >> $HOME/.bashrc
echo 'export PATH=$ROOT/bin:$PATH' >> $HOME/.bashrc
echo 'export LD_LIBRARY_PATH=$ROOT/lib:$LD_LIBRARY_PATH' >> $HOME/.bashrc
echo 'export MANPATH=$ROOT/share/man:$MANPATH' >> $HOME/.bashrc
echo 'export INFOPATH=$ROOT/share/info:$INFOPATH' >> $HOME/.bashrc

. $HOME/.bashrc

