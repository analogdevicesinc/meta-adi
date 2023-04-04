FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
BRANCH ?= "master"
SRCREV = "${@ "c4498c27761d04d4ac631ec59c1613bfed079da5" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
# Just overwrite SRC_URI as we would need to delete the python bindings patch since it does not apply
# (already fixed in 0.24) and we do not want to hardcode ';branch=master' so that we would also have to
# remove that leaving the variable empty anyways.
SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=${BRANCH} \
           file://syvinitscript.patch \
"
PV = "0.24+git${SRCPV}"

EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '-DWITH_SYSVINIT=on', '', d)}"
# This is enabled by default if network_backend is enabled. But if zeroconf is not present, we cannot
# have DHAVE_DNS_SD=ON
EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', '', '-DHAVE_DNS_SD=off', d)}"

inherit update-rc.d setuptools3

INITSCRIPT_NAME = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'iiod', '', d)}"

PACKAGECONFIG ?= "usb_backend network_backend serial_backend libiio-python3 hwmon"

PACKAGECONFIG[hwmon] = "-DWITH_HWMON=ON,-DWITH_HWMON=OFF"
