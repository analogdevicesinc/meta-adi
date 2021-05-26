FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
BRANCH ?= "master"
SRCREV = "${@ "56f7db743651e02a838aab7bf224978da8661b22" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
SRC_URI_append = ";branch=${BRANCH}"
PV = "0.21+git${SRCPV}"
SRC_URI += "file://syvinitscript.patch"

EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '-DWITH_SYSVINIT=on', '', d)}"
# This is enabled by default if network_backend is enabled. But if zeroconf is not present, we cannot
# have DHAVE_DNS_SD=ON
EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '', '-DHAVE_DNS_SD=off', d)}"

inherit update-rc.d

INITSCRIPT_NAME = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'iiod', '', d)}"

PACKAGECONFIG ?= "USB_BACKEND NETWORK_BACKEND PYTHON_BINDINGS SERIAL_BACKEND"

PACKAGECONFIG[SERIAL_BACKEND] = "-DWITH_SERIAL_BACKEND=ON,-DWITH_SERIAL_BACKEND=off,libserialport libxml2"
