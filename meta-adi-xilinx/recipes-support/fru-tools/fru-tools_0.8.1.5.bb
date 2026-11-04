SUMMARY = "Tools to display/manipulate FMC FRU info"
HOMEPAGE = "https://wiki.analog.com/resources/tools-software/linux-software/fru_dump?s[]=fru&s[]=tools"
SECTION = "console/utils"
LICENSE = "GPL-3.0-or-later & ADI-BSD"
LIC_FILES_CHKSUM = "file://license.txt;md5=600884d058742af4da113702ba4f0114"

BRANCH = "main"
# If we are in an offline build we cannot use AUTOREV since it would require internet!
SRCREV = "${@ "3b23074a1dc620a0335a27d0ece2849c4bc91ca9" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
SRC_URI = "git://github.com/analogdevicesinc/fru_tools.git;protocol=https;branch=${BRANCH}"
PV:append = "+git${SRCPV}"

S = "${WORKDIR}/git"

userlocaldir = "/usr/local"
bindest = "${userlocaldir}/bin"
masterfile = "${userlocaldir}/lib/fmc-tools/"

FILES:${PN} = "${bindest}/fru-dump ${masterfile} \
	${userlocaldir}/share/man/man1/fru-dump.1"

# so that the compiled artifact respects the OpenEmbedded ldflags
# fixes the "No GNU_HASH in the elf binary" package_qa error
TARGET_CC_ARCH += "${LDFLAGS}"

do_install() {
	oe_runmake PREFIX=${D}${userlocaldir} install
}
