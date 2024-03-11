DESCRIPTION = "ADI kernel"
LINUX_VERSION = "6.1"
ADI_VERSION = "adi-main"

PV = "${LINUX_VERSION}-${ADI_VERSION}+git${SRCPV}"
KBRANCH = "main"
# needed for offline build
SRCREV = "${@ "dc4d9bb93a52833fb3950389e2b9a5be58767eb3" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
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
