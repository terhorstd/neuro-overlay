# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="runtime API for data exchage of large scale neuronal network simulators"
HOMEPAGE="http://software.incf.org/software/music"
SRC_URI="http://software.incf.org/software/music/music/music_1.0.7.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="ownmpi"

DEPEND=" !ownmpi? ( sys-cluster/openmpi )"
RDEPEND="${DEPEND}"

inherit eutils

src_prepare() {
epatch "${FILESDIR}/${P}-usleep.patch"
}
