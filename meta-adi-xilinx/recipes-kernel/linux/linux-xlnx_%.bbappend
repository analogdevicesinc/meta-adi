DESCRIPTION = "ADI kernel"
LINUX_VERSION = "5.10"
ADI_VERSION = "adi_2021_R1"

PV = "${LINUX_VERSION}-${ADI_VERSION}+git${SRCPV}"
KBRANCH = "2021_R1"
# needed for offline build
SRCREV = "${@ "564bb35721991e0a65efd72aca0d40e6cb5f0ce7" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
KERNELURI = "git://github.com/analogdevicesinc/linux.git;protocol=https"

# override kernel config file
KBUILD_DEFCONFIG_zynq = "zynq_xcomm_adv7511_defconfig"
KBUILD_DEFCONFIG_zynqmp = "adi_zynqmp_defconfig"
KBUILD_DEFCONFIG_microblaze = "adi_mb_defconfig"

# In adi_mb_defconfig, CONFIG_INITRAMFS_SOURCE is enabled by default.
# Since we are in petalinux already, a simpleImage will be build with the proper
# initramfs so that, we don't have to provide an external one...
do_configure_prepend_microblaze() {
	[ -f ${B}/.config ] && sed -i 's,CONFIG_INITRAMFS_SOURCE=.*,,' ${B}/.config
}
