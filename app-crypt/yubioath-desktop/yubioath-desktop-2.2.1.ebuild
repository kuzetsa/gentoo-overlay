EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

DESCRIPTION="Library and tool for personalization of Yubico's YubiKey NEO"
SRC_URI="http://opensource.yubico.com/yubioath-desktop/releases/${P}.tar.gz"
HOMEPAGE="http://opensource.yubico.com/yubioath-desktop"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="BSD-2"

inherit distutils-r1

RDEPEND="dev-python/pyside
	 dev-python/pycrypto
	 dev-python/pyscard
	 dev-python/pbkdf2"

DEPEND="${RDEPEND}"

src_install()
{
	distutils-r1_src_install || die
	domenu resources/yubioath.desktop || die
	doicon resources/yubioath.xpm || die
    elog "You will need to enable and start the pcscd service"
	elog "before you run yubioath-desktop for the first time"
}
