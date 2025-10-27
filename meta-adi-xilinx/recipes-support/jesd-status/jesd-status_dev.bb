SUMMARY = "Tools to display JESD204 Status Information"
SECTION = "console/utils"
LICENSE = "ADI-BSD"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=982e522e7ec5a0beed8de5114ebfea50"

BRANCH = "main"
# If we are in an offline build we cannot use AUTOREV since it would require internet!
SRCREV = "${@ "960dbda7402c2fcc854dc830372eecb7b469ed67" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
SRC_URI = "git://github.com/analogdevicesinc/jesd-eye-scan-gtk.git;protocol=https;branch=${BRANCH}"

S = "${WORKDIR}/git"

inherit cmake pkgconfig

EXTRA_OECMAKE = "-DUSE_JESD_EYE_SCAN=OFF -DUSE_LIBIIO=ON"

DEPENDS = "ncurses libiio"
