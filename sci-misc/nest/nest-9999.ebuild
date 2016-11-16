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
CMAKE_BUILD_TYPE=None

src_prepare() {
	echo Hello world1
	#epatch "${FILESDIR}/${P}-cmake-build-type-gentoo.patch"
	# patches here
	#epatch "${FILESDIR}/${P}-some.patch"
#	echo RUNNING ${CMAKE_BINARY} -DCMAKE_INSTALL_PREFIX:PATH=${ED} \
#		 $(cmake-utils_use mpi with-mpi)\
#		 $(cmake-utils_use openmp with-openmp)\
#		 $(cmake-utils_use music with-music)\
#		 $(cmake-utils_use gsl with-gsl)\
#		 $(cmake-utils_use python with-python)\
#		 -DCMAKE_C_COMPILER=$(/usr/bin/which gcc) -DCMAKE_CXX_COMPILER=$(/usr/bin/which g++) \
#		 #-MPI_CXX_LIBRARIES MPI_CXX_INCLUDE_PATH
#		 #-DMPI_C_INCLUDE=${MPI_ROOT}/include -DMPI_C_LIBRARIES=-lmpi \
#		 #-DMPI_CXX_INCLUDE=${MPI_ROOT}/include -DMPI_CXX_LIBRARIES=-lmpicxx \
#	# .
#	echo I AM RUNNING IN $(pwd)
#	env >ebuild.env
#	${CMAKE_BINARY} -DCMAKE_INSTALL_PREFIX:PATH=${ED}\
#		 $(cmake-utils_use mpi with-mpi)\
#		 $(cmake-utils_use openmp with-openmp)\
#		 $(cmake-utils_use music with-music)\
#		 $(cmake-utils_use gsl with-gsl)\
#		 $(cmake-utils_use python with-python)\
#		 -DCMAKE_C_COMPILER=$(which gcc) -DCMAKE_CXX_COMPILER=$(which g++) \
#		 -DCMAKE_BUILD_TYPE=None \
#		 -DMPI_C_LIBRARIES=mpi -DMPI_C_INCLUDE_PATH=$MPI_ROOT/include \
	#	 -DMPI_CXX_LIBRARIES=mpicxx -DMPI_CXX_INCLUDE_PATH=$MPI_ROOT/include \
	#. || die "Configure failed"
	# tmp
		 #-DMPI_C_INCLUDE=${MPI_ROOT}/include -DMPI_C_LIBRARIES=-lmpi \
		 #-DMPI_CXX_INCLUDE=${MPI_ROOT}/include -DMPI_CXX_LIBRARIES=-lmpicxx \
	# SOLL:
	# /global/opt/cmake/3.5.2/bin/cmake -DCMAKE_INSTALL_PREFIX:PATH=/var/tmp/portage/sci-misc/nest-9999/image/gpfs/homeb/pcp0/pcp0006/\
	#	 -Dwith-mpi=ON
	#	 -Dwith-openmp=ON
	#	 -Dwith-gsl=ON
	#	 -Dwith-python=OFF
	#	 -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++
	#	 -DCMAKE_C_COMPILER=/usr/bin/gcc
	#	 -Dwith-music=ON
	#	 -DCMAKE_CXX_COMPILER=/usr/bin/g++
	#	 .
	# IST:
	# /global/opt/cmake/3.5.2/bin/cmake -DCMAKE_INSTALL_PREFIX:PATH=/var/tmp/portage/sci-misc/nest-9999/image/gpfs/homeb/pcp0/pcp0006/\
	#	 -Dwith-mpi=ON
	#	 -Dwith-openmp=ON
	#	 -Dwith-music=ON
	#	 -Dwith-gsl=ON
	#	 -Dwith-python=OFF
	#	 -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++
	#	 -DMPI_C_INCLUDE=/opt/intel/impi/5.1.3.210/includer
	#	 -DMPI_C_LIBRARIES=-lmpi
	#	 -DMPI_CXX_INCLUDE=/opt/intel/impi/5.1.3.210/include
	#	 -DMPI_CXX_LIBRARIES=-lmpicxx
	#	 .
}

src_configure() {
	# mycmakeargs is a magic name used by cmake-utils
	# see https://devmanual.gentoo.org/eclass-reference/cmake-utils.eclass/index.html
	local mycmakeargs=(
 		-DCMAKE_INSTALL_PREFIX:PATH=${ED}
		$(cmake-utils_use mpi with-mpi)
		$(cmake-utils_use openmp with-openmp)
		$(cmake-utils_use music with-music)
		$(cmake-utils_use gsl with-gsl)
		$(cmake-utils_use python with-python)
		-DMPI_C_LIBRARIES=mpi -DMPI_C_INCLUDE_PATH=$MPI_ROOT/include
		-DMPI_CXX_LIBRARIES=mpicxx -DMPI_CXX_INCLUDE_PATH=$MPI_ROOT/include
	)
	#	-DCMAKE_C_COMPILER=$(which gcc) -DCMAKE_CXX_COMPILER=$(which g++)
	#econf ${mycmakeargs}
	cmake-utils_src_configure
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
