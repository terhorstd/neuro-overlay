# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="a simulator for spiking neural network models"
HOMEPAGE="http://www.nest-simulator.org/"
SRC_URI="https://github.com/nest/nest-simulator/releases/download/v2.10.0/nest-2.10.0.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~x86"
IUSE="mpi scali python static music openmp readline"
# music use flag requires mpi
DEPEND="mpi? ( sys-cluster/openmpi )
readline? ( sys-libs/readline )
music? ( sci-libs/music )"
#  python? ( dev-lang/python )
#  gsl? ( sci-libs/gsl )

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
}
