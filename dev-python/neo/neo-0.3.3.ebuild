# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="support for reading/writing a wide range of neurophysiology file formats"
HOMEPAGE="http://packages.python.org/neo/"
SRC_URI="http://pypi.python.org/packages/source/n/neo/${P}.tar.gz"

LICENSE="BSD-3-clause"
SLOT="0"
KEYWORDS="~x86"
IUSE="hdf"

DEPEND=">=dev-lang/python-2.6
>=dev-python/numpy-1.3.0
>=sci-libs/quantities-0.9.0
>=sci-libs/scipy-0.8
hdf? ( >=dev-python/pytables-2.2 )"
#scipy >= 0.8 for NeoMatlabIO
#quantities (1.5.0 for Python 3)

RDEPEND="${DEPEND}"
