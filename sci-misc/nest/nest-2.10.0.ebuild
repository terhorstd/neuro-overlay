# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="a simulator for spiking neural network models"
HOMEPAGE="http://www.nest-simulator.org/"
SRC_URI="https://github.com/nest/nest-simulator/releases/download/v2.10.0/nest-2.10.0.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="x86"
IUSE="mpi ownmpi scali python gsl static music openmp readline"
# music use flag requires mpi
# requires libncurses || libcurses || libtermcap)
DEPEND=">=sys-libs/ncurses-4
readline? ( sys-libs/readline:* )
mpi? (
   !ownmpi? ( sys-cluster/openmpi )
)
music? ( sci-libs/music )
gsl? ( sci-libs/gsl )
python? ( >=dev-lang/python-2.7:* )"

RDEPEND="${DEPEND}"

inherit eutils

src_prepare() {
epatch "${FILESDIR}/${P}-relative_import.patch"
}

src_configure() {
econf \
    $(use_enable static) \
    $(use_with music) \
    $(use_with mpi) \
    $(use_with readline) \
    $(use_with openmp) \
    $(use_with python)
#    $(use_enable scali) \
}

src_install() {
emake DESTDIR="${D}" install
dodoc NEWS README.md
#dohtml EXTENDING.html ctags.html
if use ownmpi; then
cat <<EOT
 *
 * The 'ownmpi' use-flag is set! Remember that you need to load exactly the
 * same modules at runtime that you have also loaded now!
 *
EOT
fi
}
