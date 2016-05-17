# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="handle arithmetic and conversions of physical quantities"
HOMEPAGE="https://pypi.python.org/pypi/quantities"
#SRC_URI="http://pypi.python.org/pypi/quantities"
#SRC_URI="http://pypi.python.org/packages/source/q/quantities/${P}.tar.gz"
SRC_URI="https://pypi.python.org/packages/e4/73/23dbd5482d16e6e7bac98e3998c22cbcbecf92dda447bfe1b9ea4ae1509a/quantities-0.11.1.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE="test"

DEPEND=">=dev-lang/python-2.7 >=dev-python/numpy-1.4 test? ( dev-python/unittest2 ) "
RDEPEND=">=dev-lang/python-2.7 >=dev-python/numpy-1.4"
