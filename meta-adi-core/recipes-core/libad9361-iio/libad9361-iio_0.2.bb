SUMMARY = "Library to manage multi-chip sync on FMCOMMS5 platforms with multiple AD9361 devices"
SECTION = "libs"
LICENSE = "LGPLv2.1+"
LIC_FILES_CHKSUM = "file://LICENSE;md5=40d2542b8c43a3ec2b7f5da31a697b88"
BRANCH = "2019_R2"

# If we are in an offline build we cannot use AUTOREV since it would require internet!
SRCREV = "${@ "11293f8fa201ab1ceae80f351b71d53ac4be8198" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
PV_append = "+git${SRCPV}"

SRC_URI = "git://github.com/analogdevicesinc/libad9361-iio.git;protocol=https;branch=${BRANCH}"

S = "${WORKDIR}/git"

DEPENDS = "libiio"

inherit cmake pkgconfig
