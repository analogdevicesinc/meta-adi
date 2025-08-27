
SUMMARY = "Analog Devices python interfaces for hardware with Industrial I/O drivers"
LICENSE = "ADI-BSD"
LIC_FILES_CHKSUM = "file://LICENSE;md5=d02cc2377387c6fa1ffe41e81f191cf0"

BRANCH ?= "main"
SRCREV = "${@ "6b33acdfdb9910e89d85243fd584c136142587a6" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
SRC_URI = "git://github.com/analogdevicesinc/pyadi-iio.git;protocol=https;branch=${BRANCH}"
PV:append = "+git${SRCPV}"

S = "${WORKDIR}/git"

RDEPENDS:${PN} = "python3-numpy (>=1.20) \
				  libiio-python3 (>=0.23.1)"

inherit python_setuptools_build_meta
