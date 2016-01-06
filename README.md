# Purpose

Typically on a remote server or cluster, you do not have root permission to
installation software.  If your admins are nice, they will install software
for you. Often, they are not very nice or very responsive.

So you are stuck installing software yourself in your `/home` directory.

Linuxbrew and Gentoo Prefix are very nice but requires compilation of every 
software, and source compilation can be challenging if you do not have the 
'right' version of the `gcc` compiler. (In case you want to use these package managers, deployment scripts for both Linuxbrew and Gentoo are also included in this package.)

Most other package managers with binary repositories require root access. For
example, both `pacman` and `nix` normally require root access. To get around
this limitation, we use `proot`. As a downside, `proot` would be required
for both installing and using the installed software.


# Installation

All installations will be placed in `$ROOT`. If you do not set `$ROOT`,
it will be set to `$HOME/local` by default. Install the base and `proot` package by

    ./install.sh && . $HOME/.bashrc

This will install the `fac` installer and source the modified `.bashrc`.

If you want to use `nix`, install it by

    fac install nix

The nix store will be installed in `$ROOT/nix`.

If you want to use `pacman` (from Archlinux), install it by

    fac install pacman

The `pacman` package and its dependencies will be installed in `$ROOT/arch`.


# Use

To use `nix`, you will need to use `proot` to set up the shell environment,
and we provide `nixroot` for this task.

    nixroot    # enter the nixroot environment
    nix-env -i python
    exit

You can probably run `nix`-installed programs by invoking them using their full
path. Howeer, it is probably easier to simply use `nixroot` so you can avail 
yourself of the symbolic links set up by `nix`.

    nixroot python

If you are a fan of Archlinux, you can install its base package (and more)
using pacman.

    archroot   # enter the archroot environment

		pacman -S base
		exit

Since Archlinux distribute binaries compiled with the latest
`gcc` and libraries, most programs installed by pacman will probably not run 
in your native linux environment. So you'll need to enter the `archroot` 
environment to run `pacman`-installed programs.

    gcc --version             # probably woefully out-of-date
    archroot gcc --version    # latest and greatest

On the bright side, you now get to run Archlinux within another Linux
distribution! Just use `archroot` to enter the archroot environment (you
can still access the rest of your home directory) or use `archroot <cmd>`
to execute a single command.


# Other programs

Simple scripts for retrieving, compiling, and installing some programs are
available, such as `python`. Chances are your system already
comes with its own `python`. With a local installation of `python`, however,
you can manage your own packages using `pip`!

- python2, python3
- r, r-devel (conflicts with r)
- octave
- perl

You can see a list of available packages by

    fac install list


# Remarks

While `nix` and `pacman` are great package managers, `fac` itself is
is *not* a package manager, as it does not support uninstallation,
nor does it keep track of the packages or handle dependencies.
When you are installing packages with `fac`, the onus is on you to 
ensure that the dependency requirements are met.

If you ever want to start fresh, just delete your `$ROOT` directory.

