DESCRIPTION = "ADI kernel"
LINUX_VERSION = "5.15"
ADI_VERSION = "adi_master"

PV = "${LINUX_VERSION}-${ADI_VERSION}+git${SRCPV}"
KBRANCH = "master"
# needed for offline build
SRCREV = "${@ "77fc5a3f95023e1f966c827f35fef3f6cfdf66d4" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
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
