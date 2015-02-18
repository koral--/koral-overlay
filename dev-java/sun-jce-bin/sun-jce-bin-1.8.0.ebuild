# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/sun-jce-bin/sun-jce-bin-1.6.0.ebuild,v 1.6 2012/05/10 15:59:52 aballier Exp $

jcefile="jce_policy-8.zip"

DESCRIPTION="Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files ${PV}"
HOMEPAGE="http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html"
SRC_URI="${jcefile}"
SLOT="1.8"
LICENSE="Oracle-BCLA-JavaSE"
KEYWORDS="amd64 x86 ~amd64-fbsd ~x86-fbsd"
RESTRICT="fetch"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}/jce"

pkg_nofetch() {
	einfo "Please download ${jcefile} from:"
	einfo ${HOMEPAGE}
	einfo "(JCE Unlimited Strength Jurisdiction Policy Files 8)"
	einfo "and move it to ${DISTDIR}"
}

src_unpack() {
	if [ ! -r "${DISTDIR}"/${jcefile} ]; then
		die "cannot read ${jcefile}. Please check the permission and try again."
	fi

	unpack ${A}
}

src_install() {
	dodir ${JAVA_HOME}/jre/lib/security/

	insinto ${JAVA_HOME}/jre/lib/security/
	doins UnlimitedJCEPolicyJDK8/*.jar
	dodoc UnlimitedJCEPolicyJDK8/README.txt
}
