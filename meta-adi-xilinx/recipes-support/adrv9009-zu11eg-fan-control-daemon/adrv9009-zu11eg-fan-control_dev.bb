SUMMARY = "System daemon for controlling the fan speed on the ADRV9009-ZU11EG System On Module."
SECTION = "base"
LICENSE = "ADI-BSD"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=38c01601d5c4b84986a8f48ece946aa1"
BRANCH = "master"

SRCREV = "${@ "e00aed02214146e61c9087a57b2918b48efeabde" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
SRC_URI = "\
	git://github.com/analogdevicesinc/adrv9009-zu11eg-fan-control-daemon.git;protocol=https;branch=${BRANCH} \
	file://syvinitscript.patch \
	"
PV:append = "+git${SRCPV}"

S = "${WORKDIR}/git"

inherit update-rc.d cmake

DEPENDS = "libiio"

EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '-DWITH_SYSVINIT=on', '', d)}"

INITSCRIPT_NAME = "fancontrold"
