# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

SLOT="0"
RDEPEND="
    >=virtual/jdk-1.6
    x11-libs/gtk+:2[abi_x86_32]
    "

RESTRICT="strip"

DESCRIPTION="JD-GUI is a standalone graphical utility that displays Java source codes of \".class\" files"
HOMEPAGE="http://java.decompiler.free.fr/?q=jdgui"
SRC_URI="http://jd.benow.ca/jd-gui/downloads/jd-gui-0.3.5.linux.i686.tar.gz"
IUSE=""
KEYWORDS="~x86 ~amd64"

S="${WORKDIR}"
src_prepare() { :; }
src_install() {
#    local dir="/opt/${PN}"
    exeinto /usr/bin

    doexe jd-gui
#    fperms 755 ${dir}/jd-gui
    dodoc readme.txt

#    make_wrapper "${PN}" "${dir}/jd-gui"
}
