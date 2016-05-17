# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="test ebuild for my own overlay"
HOMEPAGE="http://lctags.sourceforge.net"
#SRC_URI="/home/dennis/sdvlp/portage/${P}.tar.gz"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
econf --with-posix-regex
}

src_install() {
emake DESTDIR="${D}" install

dodoc FAQ README make.env configure.env
#dohtml EXTENDING.html ctags.html
}
