EAPI=5

inherit java-pkg-2 eutils

DESCRIPTION="Tools for android emulators management on jenkins CI server"
HOMEPAGE="https://github.com/koral--/android-gradle-jenkins-plugin"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/jdk-1.8"
DEPEND="|| ( dev-java/gradle-bin dev-java/gradle )"

S="${WORKDIR}/android-gradle-jenkins-plugin-${PV}"

RESTRICT="test"

src_unpack() {
    unpack ${A}
    cd "${S}"
}
src_compile() { gradle :emulatorSetuper:jar :emulatorCleaner:jar ; }

src_install() {
	java-pkg_newjar "emulatorSetuper/build/libs/emulatorSetuper.jar" emulatorSetuper.jar
	java-pkg_dolauncher emulatorSetuper --jar emulatorSetuper.jar
        java-pkg_newjar "emulatorCleaner/build/libs/emulatorCleaner.jar" emulatorCleaner.jar
        java-pkg_dolauncher emulatorCleaner --jar emulatorCleaner.jar

}
