FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
BRANCH ?= "master"
SRCREV = "${@ "56f7db743651e02a838aab7bf224978da8661b22" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
SRC_URI_append = ";branch=${BRANCH}"
PV = "0.21+git${SRCPV}"
SRC_URI += "file://syvinitscript.patch"

EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '-DWITH_SYSVINIT=on', '', d)}"

inherit update-rc.d

INITSCRIPT_NAME = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'iiod', '', d)}"

