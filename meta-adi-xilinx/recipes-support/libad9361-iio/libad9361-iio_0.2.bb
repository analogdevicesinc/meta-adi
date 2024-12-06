SUMMARY = "Library to manage multi-chip sync on FMCOMMS5 platforms with multiple AD9361 devices"
SECTION = "libs"
LICENSE = "LGPL-2.1-or-later"
LIC_FILES_CHKSUM = "file://LICENSE;md5=40d2542b8c43a3ec2b7f5da31a697b88"
BRANCH = "2023_R2"

# If we are in an offline build we cannot use AUTOREV since it would require internet!
SRCREV = "${@ "d692a52a869ac2665e9e49907c7e0db41c4d13f6" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
PV:append = "+git${SRCPV}"

SRC_URI = "git://github.com/analogdevicesinc/libad9361-iio.git;protocol=https;branch=${BRANCH}"

S = "${WORKDIR}/git"

DEPENDS = "libiio"

inherit cmake pkgconfig
