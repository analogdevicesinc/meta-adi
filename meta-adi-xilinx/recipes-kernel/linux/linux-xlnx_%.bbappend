DESCRIPTION = "ADI kernel"
BRANCH = "master"
# always use latest source revision
SRCREV = "${AUTOREV}"
SRC_URI += "git://github.com/analogdevicesinc/linux.git;protocol=https;branch=${BRANCH}"
KBRANCH = "${BRANCH}"
PV = "4.19"
# override kernel config file
KBUILD_DEFCONFIG_zynq = "zynq_xcomm_adv7511_defconfig"
KBUILD_DEFCONFIG_zynqmp = "adi_zynqmp_defconfig"
KBUILD_DEFCONFIG_microblaze = "adi_mb_defconfig"

# In adi_mb_defconfig, CONFIG_INITRAMFS_SOURCE is enabled by default.
# Since we are in petalinux already, a simpleImage will be build with the proper
# initramfs so that, we don't have to provide an external one...
do_configure_prepend_microblaze() {
	sed -i 's,CONFIG_INITRAMFS_SOURCE=.*,,' ${B}/.config
}

