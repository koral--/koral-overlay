# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/android-sdk-update-manager/android-sdk-update-manager-23.ebuild,v 1.2 2014/10/15 20:22:19 pacho Exp $

EAPI="5"

inherit eutils user udev

MY_P="android-sdk_r${PV}-linux"

DESCRIPTION="Open Handset Alliance's Android SDK"
HOMEPAGE="http://developer.android.com"
SRC_URI="http://dl.google.com/android/${MY_P}.tgz"
IUSE="+X"
RESTRICT="mirror sandbox"

LICENSE="android"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-arch/tar
		app-arch/gzip"
RDEPEND=">=virtual/jdk-1.5
	>=dev-java/ant-core-1.6.5
	X? ( || ( dev-java/swt:3.8[cairo] )
	     || ( >=x11-libs/gtk+-2.24.23-r2:2 )
	   )
"

ANDROID_SDK_DIR="/opt/${PN}"
QA_FLAGS_IGNORED_x86="
	${ANDROID_SDK_DIR/\/}/tools/emulator
	${ANDROID_SDK_DIR/\/}/tools/adb
	${ANDROID_SDK_DIR/\/}/tools/mksdcard
	${ANDROID_SDK_DIR/\/}/tools/sqlite3
	${ANDROID_SDK_DIR/\/}/tools/hprof-conv
	${ANDROID_SDK_DIR/\/}/tools/zipalign
	${ANDROID_SDK_DIR/\/}/tools/dmtracedump
"
QA_FLAGS_IGNORED_amd64="${QA_FLAGS_IGNORED_x86}"

QA_PREBUILT="${ANDROID_SDK_DIR/\/}/tools/*"

S="${WORKDIR}/android-sdk-linux"

pkg_setup() {
	enewgroup android
}

src_prepare(){
	rm -rf tools/lib/x86*
	rm tools/lib/*.so
	rm -rf tools/lib/monitor-x86
       rm tools/emulator
       rm tools/emulator-x86
       rm tools/emulator-arm
       rm tools/emulator-mips
        rm -rf tools/qemu/linux-x86
        rm -rf tools/bin

	if ! use X; then
		rm tools/draw9patch
		rm tools/ddms
		rm tools/monitor
		rm tools/uiautomatorviewer
		rm tools/hierarchyviewer
		rm tools/lib/ddms.jar
                rm tools/lib/draw9patch.jar
                rm tools/lib/hierarchyviewer2.jar
                rm tools/lib/hierarchyviewer2lib.jar
		rm -rf tools/lib/monitor-x86_64
		rm tools/lib/ddmlib.jar
                rm tools/lib/ddmuilib.jar
		rm tools/hierarchyviewer2.jar
                rm tools/hierarchyviewer2lib.jar
	fi
}

src_install(){

	dodir "${ANDROID_SDK_DIR}/tools"
	dodir "${ANDROID_SDK_DIR}/tools/lib/x86_64"

	cp -pPR tools/* "${ED}${ANDROID_SDK_DIR}/tools" || die "failed to install tools"

	dodir "${ANDROID_SDK_DIR}"/{add-ons,build-tools,docs,extras,platforms,platform-tools,samples,sources,system-images,temp}
	fowners root:android "${ANDROID_SDK_DIR}"/{.,add-ons,build-tools,docs,extras,platforms,platform-tools,samples,sources,system-images,temp,tools}
	fowners root:android "${ANDROID_SDK_DIR}"/tools/mksdcard
	fowners root:android "${ANDROID_SDK_DIR}"/tools/emulator64-x86
	fowners root:android "${ANDROID_SDK_DIR}"/tools/android
	fowners root:android "${ANDROID_SDK_DIR}"/tools/lint
	fowners root:android "${ANDROID_SDK_DIR}"/tools/emulator64-arm
	fperms 0775 "${ANDROID_SDK_DIR}"/{.,add-ons,build-tools,docs,extras,platforms,platform-tools,samples,sources,system-images,temp,tools}
        fperms 0755 "${ANDROID_SDK_DIR}"/{.,add-ons,build-tools,docs,extras,platforms,platform-tools,samples,sources,system-images,temp,tools}
        fperms 0755 "${ANDROID_SDK_DIR}"/tools/mksdcard
        fperms 0755 "${ANDROID_SDK_DIR}"/tools/emulator64-x86
        fperms 0755 "${ANDROID_SDK_DIR}"/tools/android
        fperms 0755 "${ANDROID_SDK_DIR}"/tools/lint
        fperms 0755 "${ANDROID_SDK_DIR}"/tools/emulator64-arm

	echo "PATH=\"${EPREFIX}${ANDROID_SDK_DIR}/tools:${EPREFIX}${ANDROID_SDK_DIR}/platform-tools\"" > "${T}/80${PN}" || die

	SWT_PATH=
	SWT_VERSIONS="3.8"
	for version in $SWT_VERSIONS; do
		# redirecting stderr to /dev/null
		# not sure if this is best, but avoids misleading error messages
		SWT_PATH="`dirname \`java-config -p swt-\$version 2>/dev/null\` 2>/dev/null`"
		if [ $SWT_PATH ]; then
			einfo "SWT_PATH=$SWT_PATH selecting version $version of SWT."
			break
		fi
	done
	if [[ ! -z "$SWT_PATH" ]]; then
		echo "ANDROID_SWT=\"${SWT_PATH}\"" >> "${T}/80${PN}" || die
	fi
	echo "ANDROID_HOME=\"${EPREFIX}${ANDROID_SDK_DIR}\"" >> "${T}/80${PN}" || die

	doenvd "${T}/80${PN}"

	echo "SEARCH_DIRS_MASK=\"${EPREFIX}${ANDROID_SDK_DIR}\"" > "${T}/80${PN}" || die

	insinto "/etc/revdep-rebuild" && doins "${T}/80${PN}"

	udev_dorules "${FILESDIR}"/80-android.rules || die
	domenu "${FILESDIR}"/android-sdk-update-manager.desktop

}

pkg_postinst() {
	elog "The Android SDK now uses its own manager for the development	environment."
	elog "Run 'android' to download the full SDK, including some of the platform tools."
	elog "You must be in the android group to manage the development environment."
	elog "Just run 'gpasswd -a <USER> android', then have <USER> re-login."
	elog "See http://developer.android.com/sdk/adding-components.html for more"
	elog "information."
	elog "If you have problems downloading the SDK, see http://code.google.com/p/android/issues/detail?id=4406"
	elog "You need to run env-update and source /etc/profile in any open shells"
	elog "if you get an SWT error."
}