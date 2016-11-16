# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Distributed MultiThreaded CheckPointing library"
HOMEPAGE="http://dmtcp.sourceforge.net/"
	#https://sourceforge.net/projects/dmtcp/files//dmtcp-2.5.0_rc2.tar.gz/download
#SRC_URI="https://sourceforge.net/projects/dmtcp/files/2.5.0-rc2/dmtcp-2.5.0-rc2.tar.gz/download"
SRC_URI="https://github.com/dmtcp/dmtcp/archive/2.5.0-rc2.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="ownmpi"

DEPEND=" !ownmpi? ( sys-cluster/openmpi )"
RDEPEND="${DEPEND}"

inherit eutils

src_unpack() {
	unpack ${A}
	echo $WORKDIR
	ls $WORKDIR
	mv -iv $WORKDIR/dmtcp-2.5.0-rc2 $S
}
src_prepare() {
	#epatch "${FILESDIR}/${P}-usleep.patch"
	echo "foo"
}
