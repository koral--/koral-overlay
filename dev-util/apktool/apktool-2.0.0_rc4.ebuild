EAPI=5

inherit java-pkg-2 eutils

DESCRIPTION="A tool for reverse engineering 3rd party, closed, binary Android apps"
HOMEPAGE="https://code.google.com/p/android-apktool/"
SRC_URI="https://github.com/iBotPeaches/Apktool/archive/v2.0.0-RC4.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/jdk-1.7"
DEPEND=""

S="${WORKDIR}/Apktool-2.0.0-RC4"

RESTRICT="test"

src_unpack() {
    unpack ${A}
    cd "${S}"
    epatch "${FILESDIR}/build.gradle.patch"
    epatch "${FILESDIR}/smali.build.gradle.patch"
}
src_compile() { ./gradlew build fatJar proguard -x test; }

src_install() {
	java-pkg_newjar "brut.apktool/apktool-cli/build/libs/apktool-cli.jar"
	java-pkg_dolauncher
}
