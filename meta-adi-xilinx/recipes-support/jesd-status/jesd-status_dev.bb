SUMMARY = "Tools to display JESD204 Status Information"
SECTION = "console/utils"
LICENSE = "ADI-BSD"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=38c01601d5c4b84986a8f48ece946aa1"

BRANCH = "main"
# If we are in an offline build we cannot use AUTOREV since it would require internet!
SRCREV = "${@ "90cad36a2c09e0fbea9763aca4ae0f72f1677bbc" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
SRC_URI = "git://github.com/analogdevicesinc/jesd-eye-scan-gtk.git;protocol=https;branch=${BRANCH}"

S = "${WORKDIR}/git"

inherit cmake pkgconfig

EXTRA_OECMAKE = "-DUSE_JESD_EYE_SCAN=OFF -DUSE_LIBIIO=ON"

DEPENDS = "ncurses libiio"
