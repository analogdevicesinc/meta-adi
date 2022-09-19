FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
BRANCH ?= "master"
SRCREV = "${@ "4a869116f0bad8d669319611c0ebb4596a33e2a3" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
SRC_URI_append = ";branch=${BRANCH} file://syvinitscript.patch"
PV = "0.24+git${SRCPV}"

EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '-DWITH_SYSVINIT=on', '', d)}"
# This is enabled by default if network_backend is enabled. But if zeroconf is not present, we cannot
# have DHAVE_DNS_SD=ON
EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '', '-DHAVE_DNS_SD=off', d)}"

inherit update-rc.d setuptools3

INITSCRIPT_NAME = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'iiod', '', d)}"

PACKAGECONFIG ?= "usb_backend network_backend serial_backend libiio-python3"

PACKAGECONFIG[serial_backend] = "-DWITH_SERIAL_BACKEND=ON,-DWITH_SERIAL_BACKEND=off,libserialport libxml2"

# Inheriting setuptools3 incorrectly adds the dependency on ${PYTHON_PN}-core
# to ${PN} instead of to ${PN}-${PYTHON_PN} where it belongs.
RDEPENDS_${PN}_remove = "${PYTHON_PN}-core"
RDEPENDS_${PN}-${PYTHON_PN} =+ "${PYTHON_PN}-core"

# Explicitly define do_configure, do_compile and do_install because both cmake and setuptools3 have
# EXPORT_FUNCTIONS do_configure do_compile do_install
do_configure() {
	cmake_do_configure
}

do_compile() {
	cmake_do_compile
}

do_install() {
	cmake_do_install
}
