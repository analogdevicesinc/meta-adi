SUMMARY = "System daemon for controlling the fan speed on the ADRV9009-ZU11EG System On Module."
SECTION = "base"
LICENSE = "ADI-BSD"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=38c01601d5c4b84986a8f48ece946aa1"
BRANCH = "2019_R2"

SRCREV = "${@ "0503352702e5944fca303af9e23b25216d59c00c" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
SRC_URI = "git://github.com/analogdevicesinc/adrv9009-zu11eg-fan-control-daemon.git;protocol=https;branch=${BRANCH}"
PV_append = "+git${SRCPV}"

S = "${WORKDIR}/git"

inherit update-rc.d cmake

DEPENDS = "libiio"

EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '-DWITH_SYSVINIT=on', '', d)}"

INITSCRIPT_NAME = "fancontrold"
RDEPENDS_${PN} += "lsb"
