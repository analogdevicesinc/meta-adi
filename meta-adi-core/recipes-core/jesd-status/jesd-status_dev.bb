SUMMARY = "Tools to display JESD204 Status Information"
SECTION = "console/utils"
LICENSE = "ADI-BSD"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=38c01601d5c4b84986a8f48ece946aa1"
# set this variable since ADI BSD is not a generic license supported in yocto and hence,
# some warning would be printed...
NO_GENERIC_LICENSE[ADI-BSD] = "LICENSE.txt"

# just pick the last revision on master
SRCREV = "${AUTOREV}"
SRC_URI = "git://github.com/analogdevicesinc/jesd-eye-scan-gtk.git"

S = "${WORKDIR}/git"

DEPENDS = "ncurses"

# so that the compiled artifact respects the OpenEmbedded ldflags
# fixes the "No GNU_HASH in the elf binary" package_qa error
TARGET_CC_ARCH += "${LDFLAGS}"
# overwrite do_compile since we only want to build jesd_status
do_compile() {
	oe_runmake jesd_status
}

bindest = "/usr/local/bin"

FILES_${PN} = "${bindest}/jesd_status"

do_install() {
	install -d ${D}/${bindest}
	install -m 755 ${B}/jesd_status ${D}/${bindest}/jesd_status
}
