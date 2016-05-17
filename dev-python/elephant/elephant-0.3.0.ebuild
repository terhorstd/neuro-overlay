# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit distutils-r1

DESCRIPTION="ELEctroPHysiology ANalysis Toolkit"
HOMEPAGE="http://elephant.readthedocs.io/en/latest/"
SRC_URI=""
#http://pypi.python.org/pypi/elephant/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="pandas asset doc test"

# these dependencies are lowered to make the software available to older systems
# lets see how that works out...
DEPEND=">=dev-lang/python-2.7:*
>=dev-python/numpy-1.8.1
>=sci-libs/scipy-0.13.3
dev-python/pip
dev-python/six
=dev-python/neo-0.3.3
pandas? (  >=dev-python/pandas-0.13.1 )
asset? ( >=sci-libs/scikits_learn-0.14.1 )
doc? (  >=dev-python/numpydoc-0.4  >=dev-python/sphinx-1.2.2 )
test? ( >=dev-python/nose-1.3.1 )"
#DEPEND=">=dev-lang/python-2.7
#    >=dev-python/numpy-1.8.2
#    >=dev-python/scipy-0.14.0
#    dev-python/pip
#    dev-python/six
#    =dev-python/neo-0.4.0
#    pandas? (  >=dev-python/pandas-0.14.1 )
#    asset? ( >=sci-libs/scikits_learn-0.15.1 )
#    doc? (  >=dev-python/numpydoc-0.5  >=dev-python/sphinx-1.2.2 )
#    test? ( >=dev-python/nose-1.3.3 )"
#    >=quantities-0.10.1
RDEPEND=">=dev-lang/python-2.7
>=dev-python/numpy-1.8.1
>=sci-libs/scipy-0.13.3
dev-python/pip
dev-python/six
=dev-python/neo-0.3.3
pandas? (  >=dev-python/pandas-0.13.1 )
asset? ( >=sci-libs/scikits_learn-0.14.1 )"
