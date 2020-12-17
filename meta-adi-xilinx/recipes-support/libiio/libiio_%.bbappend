BRANCH ?= "2019_R2"
SRCREV = "${@ "565bf68eccfdbbf22cf5cb6d792e23de564665c7" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
SRC_URI_append = ";branch=${BRANCH}"
PV = "0.21+git${SRCPV}"

EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '-DWITH_SYSVINIT=on', '', d)}"

inherit update-rc.d

INITSCRIPT_NAME = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'iiod', '', d)}"
# it depends on lsb to run the iiod service
RDEPENDS_${PN}-iiod += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'lsb', '', d)}"
