DESCRIPTION = "ADI kernel"
LINUX_VERSION_EXTENSION = "adi-v2025.1"

# Note that xilinx is on 6.12.x. but we are still on 6.12 so that will mismatch on the package version.
# We let it mismatch so we do not mess with PREFERRED_VERSION_linux-xlnx set by xilinx layer in a way that
# the wrong recipe would be picked or the build would complain about no recipe suiting the preferred version.
# Also since the major version is the same, there's no issue with the yocto kernel version sanity check.
PV = "${LINUX_VERSION}-${LINUX_VERSION_EXTENSION}+git${SRCPV}"
KBRANCH = "main"
# needed for offline build
SRCREV = "${@ "ec1bbe510ba6764423efea7738f0feca8d0b4fb1" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
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
