# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

SLOT="0"
LICENSE="*"
KEYWORDS="~amd64 ~x86"
DESCRIPTION="Kiczowaty i ci??ki odtwarzacz live-tv dla linuksa."
SRC_BASE="http://ipla.pl/templates/ipla/assets/iplalite.air http://kist.googlecode.com/svn/branches/ipla"
SRC_URI=${SRC_BASE}
HOMEPAGE="http://www.ipla.pl"
IUSE=""
DEPEND="app-arch/unzip
	dev-util/adobe-air-sdk-bin
	dev-libs/nss"
RDEPEND=""

pkg_nofetch() {
	elog "Please download http://ipla.pl/templates/ipla/assets/iplalite.air"
	elog "and save to ${DISTDIR}"
}

src_unpack() {
	for i in ${A}; do
		if [[ ${i} = *.air ]]; then
			dodir ${WORKDIR}/ipla
			unzip ${DISTDIR}/${i} -d ${WORKDIR}/ipla || die "Unable to unzip"
		fi
	done
}

src_install() {
	declare IPLA_HOME="/opt/AIR-apps/ipla-lite"

	dodir /opt/AIR-apps || die
	dodir /opt/AIR-apps/ipla-lite || die

	mv "${WORKDIR}"/ipla/* ${D}/opt/AIR-apps/ipla-lite || die
	exeinto /usr/bin
	doexe ${DISTDIR}/ipla
	chmod +x ${D}/usr/bin/ipla
}

pkg_postinst() {
	ewarn "Imporant:"
	elog "Notice, that to run Ipla, you must run"
	elog "desktop environment, i.e. Gnome or KDE."
	elog "Ipla will not work on fluxbox or openbox."
	elog ""
	elog "Now, you can run ipla by typing \"ipla\" in terminal."
	elog "I give you no guarantee, that ipla will run - it's so crazy."
	elog ""
	elog "If ipla start, but does not connect to internet, visit"
	elog "http://kb2.adobe.com/cps/492/cpsid_49267.html"
}
