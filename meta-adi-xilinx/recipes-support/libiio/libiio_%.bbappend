FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
BRANCH ?= "libiio-v0"
SRCREV = "${@ "ba74e6c53007925ff714ed28a258b5aebf6a3ad4" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
# Just overwrite SRC_URI as we would need to delete the python bindings patch since it does not apply
# (already fixed in 0.24) and we do not want to hardcode ';branch=master' so that we would also have to
# remove that leaving the variable empty anyways.
SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https;branch=${BRANCH} \
           file://syvinitscript.patch \
"
PV = "0.26+git${SRCPV}"

EXTRA_OECMAKE += " \
	${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '-DWITH_SYSVINIT=on', '', d)} \
	-DCPP_BINDINGS=ON \
	-DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
	-DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines' \
"

inherit update-rc.d

INITSCRIPT_NAME = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'iiod', '', d)}"

PACKAGECONFIG ?= "usb_backend network_backend serial_backend libiio-python3 hwmon"

PACKAGECONFIG[hwmon] = "-DWITH_HWMON=ON,-DWITH_HWMON=OFF"
