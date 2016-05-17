
#neuro-overlay

   This repository contains a Portage overlay for the packets of the NEST
   framework.

   [Portage] [1] is a very flexible package management system that handles
   installation of packages and their dependencies. The installation of each
   package is described in an *ebuild* file which contains the information of
   where to find the source and how to compile and install a piece of software.

   A huge benefit of the portage system is the direct installation from
   upstream-provided source files and the very flexible package configuration.
   The source packages can be compiled for the specific architecture and the
   specification of *use-flags* enables or disables package features (and
   changes the installed dependencies accordingly).

   Alongside the rich official ['gentoo' portage tree] [2] there is also the
   possibility to add or replace packages in a so called *overlay*. This is a
   package tree similar to the base tree. The overlay will be searched first,
   so it can provide alternative packets or mask or add packets. When new
   packages are to be added to the tree, they are usually added to an overlay
   first, which eventually is merged into the main portage tree.

   This repository contains *ebuild* files for packages related to the **NEST
   framework** (see <http://www.nest-initiative.org/> and
   <http://www.nest-simulator.org/>). Dependencies are included and separate
   ebuilds are provided if they are not in the gentoo base portage tree.

   [1]: https://wiki.gentoo.org/wiki/Project:Portage
   [2]: https://packages.gentoo.org/


## List of packets

   To get a list of packets included in this overlay run

        find . -name "*.ebuild"

   in the base directory of this repository.


## How to use

   In order to use this overlay in a working Gentoo installation simply add the
   path to the `PORTDIR_OVERLAY` variable in `/etc/portage/make.conf`.  If such a
   variable doesn't exist, just add a new line somewhere in the file. So,
   assuming this repository is located at "/path/to/neuro-overlay", you should
   add a line like:

        PORTDIR_OVERLAY="/path/to/neuro-overlay"

   Once the overlay is known to the system you can use the normal commands to
   handle packet installation.

        emerge -avt nest

   For the packets with `~x86` keyword you need to edit the
   `/etc/portage/package.keyword`. The selected options for the packets you set
   in `/etc/portage/package.use` as usual, or directly on the command line by
   specifying a the `USE` variable:

        USE="music mpi" emerge -avt nest

