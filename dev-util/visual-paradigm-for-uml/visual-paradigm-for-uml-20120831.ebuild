# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit versionator eutils

MY_PN="Visual_Paradigm_for_UML"
MY_P="${MY_PN}_$(get_version_component_range 1-2)"
if [[ $(get_version_component_count) == 3 ]]; then
	MY_PV="$(replace_all_version_separators _)"
else
	MY_PV="$(replace_all_version_separators _ $(get_version_component_range 1-2))"
	MY_PV="${MY_PV}_sp$(get_version_component_range 3)"
	MY_PV="${MY_PV}_$(get_version_component_range 4)"
fi

DESCRIPTION="Visual Paradigm for UML"
HOMEPAGE="http://www.visual-paradigm.com"
SRC_URI="http://eu4.visual-paradigm.com/visual-paradigm/vpuml20120831//Visual_Paradigm_for_UML_Linux_64bit_NoInstall_10_0_20120831.tar.gz"

S="${WORKDIR}/${MY_P}"

LICENSE="as-is" # actually, proprietary
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND=">=virtual/jre-1.5
	x11-misc/xdg-utils
	sys-auth/polkit"

INSTDIR="/opt/Visual-Paradigm/${MY_PN}"

src_install() {
	insinto "${INSTDIR}"
	doins -r bin bundled integration lib ormlib \
		resources scripts sde shapes updatesynchronizer \
		UserLanguage .install4j

	rm "${D}${INSTDIR}"/.install4j/firstrun

	chmod +x "${D}${INSTDIR}"/bin/*
	dodoc -r Samples

	make_desktop_entry "${INSTDIR}"/bin/${MY_P} "Visual Paradigm for UML" "${INSTDIR}"/resources/vpuml.png
	make_desktop_entry "pkexec ${INSTDIR}/bin/VP-UML_Product_Edition_Manager" "VP UML Product Edition Manager" "${INSTDIR}"/resources/vpuml.png

	dodir /etc/env.d
	echo CONFIG_PROTECT="${INSTDIR}/resources/product_edition.properties" > "${D}"/etc/env.d/99visualparadigm
	}
