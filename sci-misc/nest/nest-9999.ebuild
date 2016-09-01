# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="a simulator for spiking neural network models"
HOMEPAGE="http://www.nest-simulator.org/"
#SRC_URI="https://github.com/nest/nest-simulator/releases/download/v2.10.0/nest-2.10.0.tar.gz"


	EGIT_BRANCH="master"
	EGIT_REPO_URI="https://github.com/nest/nest-simulator.git"
	#S="${WORKDIR}/slimserver"
	INHERIT_VCS="git-2"
	KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2+"
RESTRICT="bindist mirror"
SLOT="0"
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

CMAKE_BINARY="/global/opt/cmake/3.5.2/bin/cmake"
CMAKE_MIN_VERSION="3.5"
export CMAKE_BUILD_TYPE=""
inherit ${INHERIT_VCS} eutils cmake-utils

src_prepare() {
	echo Hello world1
	# patches here
	#epatch "${FILESDIR}/${P}-some.patch"
	${CMAKE_BINARY} -DCMAKE_INSTALL_PREFIX:PATH=${ED} $(cmake-utils_use mpi with-mpi) . || die "Configure failed"
}

#src_compile() {
#	echo Hello world
	# -Dwith-libneurosim=[OFF|ON|</path/to/libneurosim>]
	# -Dwith-mpi=[OFF|ON|</path/to/mpi>]
	# -Dwith-openmp=[OFF|ON|<OpenMP-Flag>]
	# -Dwith-gsl=[OFF|ON|</path/to/gsl>]
	# -Dwith-readline=[OFF|ON|</path/to/readline>]
	# -Dwith-ltdl=[OFF|ON|</path/to/ltdl>]
	# -Dwith-python=[OFF|ON|2|3]
	# -DCMAKE_C_COMPILER=<C-compiler> -DCMAKE_CXX_COMPILER=<C++-compiler>
	# 
	#econf \
	#    $(use_enable static) \
	#    $(use_with music) \
	#    $(use_with mpi) \
	#    $(use_with readline) \
	#    $(use_with openmp) \
	#    $(use_with python)
	#    $(use_enable scali) \
#	emake
#}

#src_install() {
#	emake DESTDIR="${ED}" install
#	dodoc NEWS README.md
#	#dohtml EXTENDING.html ctags.html
#	if use ownmpi; then
#		cat <<EOT
# *
# * The 'ownmpi' use-flag is set! Remember that you need to load exactly the
# * same modules at runtime that you have also loaded now!
# *
#EOT
#	fi
#}
