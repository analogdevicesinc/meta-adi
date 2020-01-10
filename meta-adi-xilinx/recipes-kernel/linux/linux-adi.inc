require recipes-kernel/linux/linux-xlnx.inc

DESCRIPTION = "ADI kernel"
# Default to latest revision
SRCREV ?= "${AUTOREV}"
PV = "${LINUX_VERSION}-${ADI_VERSION}+git${SRCPV}"

SRC_URI = "git://github.com/analogdevicesinc/linux.git;protocol=https;branch=${KBRANCH}"

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
