# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Generic support library for neuronal simulators"
HOMEPAGE="http://software.incf.org/software/libneurosim"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

inherit subversion
ESVN_REPO_URI="http://svn.incf.org/svn/libneurosim/trunk"
ESVN_PROJECT="libneurosim"
