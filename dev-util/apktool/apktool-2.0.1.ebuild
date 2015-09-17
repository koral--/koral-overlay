EAPI=5

inherit java-pkg-2 eutils

DESCRIPTION="A tool for reverse engineering 3rd party, closed, binary Android apps"
HOMEPAGE="https://code.google.com/p/android-apktool/"
SRC_URI="https://github.com/iBotPeaches/Apktool/archive/${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/jdk-1.7"
DEPEND="virtual/gradle"

S="${WORKDIR}/Apktool-${PV}"

RESTRICT="test"

src_unpack() {
    unpack ${A}
    cd "${S}"
}
src_compile() { gradle build fatJar proguard -x test; }

src_install() {
	java-pkg_newjar "brut.apktool/apktool-cli/build/libs/apktool-cli.jar" apktool.jar
	java-pkg_newjar "brut.apktool.smali/smali/build/libs/smali-2.0.6-dev.jar" smali.jar
	java-pkg_newjar "brut.apktool.smali/baksmali/build/libs/baksmali-2.0.6-dev.jar" baksmali.jar

	java-pkg_dolauncher apktool --jar apktool.jar
	java-pkg_dolauncher smali --jar smali.jar
	java-pkg_dolauncher baksmali --jar baksmali.jar
}
