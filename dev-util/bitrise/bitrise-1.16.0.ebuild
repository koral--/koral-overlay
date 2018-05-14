# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build

EGO_ON="github.com/bitrise-io"
EGO_PN="${EGO_ON}/${PN}"
ARCHIVE_URI="https://${EGO_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

DESCRIPTION="Run your Bitrise.io automations on any Mac or Linux machine."
HOMEPAGE="https://www.bitrise.io/cli"
SRC_URI="${ARCHIVE_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc"

DEPEND=""
RDEPEND=""

S="${WORKDIR}/src/${EGO_ON}/${PN}"
BITRISE_BIN="bin/${PN}"

src_unpack() {
	unpack ${A}
	mkdir -p "${WORKDIR}/src/${EGO_ON}"
	mv "${WORKDIR}/${P}" "${WORKDIR}/src/${EGO_ON}/bitrise" || die "Couldn't move sources to GOPATH"
}

src_compile() {
	GOPATH="${WORKDIR}" go build -v -o "${BITRISE_BIN}" || die "Couldn't compile bitrise"

}

src_test() {
	export PULL_REQUEST_ID=""
	export INTEGRATION_TEST_BINARY_PATH="${S}/${BITRISE_BIN}"
	rm "${S}/_tests/integration/version_test.go"
	GOPATH="${WORKDIR}" go test -v ./_tests/integration/... || die "Integration tests failed"
}

src_install() {
	dobin "${BITRISE_BIN}" || die "Couldn't install bitrise binary"
	if use doc; then
		dodoc -r _docs README.md || die "Couldn't install documentation"
	fi
}
