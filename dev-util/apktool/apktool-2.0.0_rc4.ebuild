EAPI=5

inherit java-pkg-2

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

src_compile() { ./gradlew build -x test; }

src_install() {
	java-pkg_newjar "build/libs/Apktool-2.0.0-RC4.jar"
	java-pkg_dolauncher
}
