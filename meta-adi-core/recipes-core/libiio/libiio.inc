SUMMARY = "Library for interfacing with IIO devices"
HOMEPAGE = "https://wiki.analog.com/resources/tools-software/linux-software/libiio"
SECTION = "libs"
LICENSE = "LGPLv2.1+"
LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"

BRANCH ?= "2019_R1"

SRC_URI = "git://github.com/analogdevicesinc/libiio.git;branch=${BRANCH}"
S = "${WORKDIR}/git"

DEPENDS = "flex-native bison-native avahi libaio libusb1 libxml2"

# skip rpath so that, do_package_qa won't complain about redundant
# rpaths in the shared objects, since they are being installed to
# default locations
EXTRA_OECMAKE += "-DCMAKE_SKIP_RPATH=on -DWITH_SYSVINIT=on"

inherit cmake pkgconfig update-rc.d

INITSCRIPT_NAME = "iiod"

# it depends on lsb to run the iiod service
# we might want to consider in having iiod as a separate
# package
RDEPENDS_${PN} = "lsb"
