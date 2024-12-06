DESCRIPTION = "ADI kernel"
LINUX_VERSION = "6.1.70"
# Taken from the xilinx recipe. We include the version from the recipe filename so we can
# properly match it from PREFERRED_VERSION_linux-xlnx amd hence get the right recipe to run.
LINUX_VERSION_EXTENSION = "adi-v${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or ''}"

PV = "${LINUX_VERSION}-${LINUX_VERSION_EXTENSION}+git${SRCPV}"
KBRANCH = "2023_R2"
# needed for offline build
SRCREV = "${@ "54eb23f4b5c6093916f208772627f7b68f495559" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
KERNELURI = "git://github.com/analogdevicesinc/linux.git;protocol=https"

# override kernel config file
KBUILD_DEFCONFIG:zynq = "zynq_xcomm_adv7511_defconfig"
KBUILD_DEFCONFIG:zynqmp = "adi_zynqmp_defconfig"
KBUILD_DEFCONFIG:microblaze = "adi_mb_defconfig"
KBUILD_DEFCONFIG:versal = "adi_versal_defconfig"

# In adi_mb_defconfig, CONFIG_INITRAMFS_SOURCE is enabled by default.
# Since we are in petalinux already, a simpleImage will be build with the proper
# initramfs so that, we don't have to provide an external one...
do_configure:prepend:microblaze() {
	[ -f ${B}/.config ] && sed -i 's,CONFIG_INITRAMFS_SOURCE=.*,,' ${B}/.config
}
