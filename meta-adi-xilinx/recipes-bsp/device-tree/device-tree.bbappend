FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_zynq = " \
		file://pl-zynqmp-zcu102-rev10-ad9361-fmcomms2-3-overlay.dtsi \
		file://pl-delete-nodes-zynq-zed-adv7511-ad9361-fmcomms2-3.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9434-fmc-500ebz.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-fmcdaq2.dtsi \
		file://pl-delete-nodes-zynq-zed-adv7511.dtsi \
		file://pl-delete-nodes-zynq-zed-adv7511-ad9467-fmc-250ebz.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-adrv9009.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-adrv9371.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad6676-fmc.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9739a-fmc.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9625-fmcadc2.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9265-fmc-125ebz.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9361-fmcomms2-3.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9361-fmcomms5.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-fmcomms11.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-fmcdaq3-revC.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-fmcjesdadc1.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-adrv9008-1-jesd204-fsm.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-adrv9008-2-jesd204-fsm.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9172-fmc-ebz.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-adrv9375-jesd204-fsm.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9081.dtsi \
		file://pl-delete-nodes-zynq-zed-imageon.dtsi \
		file://pl-delete-nodes-zynq-adrv9361-z7035-bob-cmos.dtsi \
		file://pl-delete-nodes-zynq-adrv9361-z7035-bob.dtsi \
		file://pl-delete-nodes-zynq-adrv9361-z7035-fmc.dtsi \
		file://pl-delete-nodes-zynq-adrv9364-z7020-bob-cmos.dtsi \
		file://pl-delete-nodes-zynq-adrv9364-z7020-bob.dtsi \
		file://pl-delete-nodes-zynq-zc702-adv7511-ad9361-fmcomms5.dtsi \
		file://pl-delete-nodes-zynq-zc702-adv7511.dtsi"

SRC_URI_append_zynqmp = " \
		file://pl-delete-nodes-zynqmp-zcu102-rev10-adrv9009-jesd204-fsm.dtsi \
		file://pl-delete-nodes-zynqmp-zcu102-rev10-fmcdaq2.dtsi \
		file://pl-delete-nodes-zynqmp-zcu102-rev10-adrv9371-jesd204-fsm.dtsi \
		file://pl-delete-nodes-zynqmp-zcu102-rev10-ad9361-fmcomms2-3.dtsi \
		file://pl-delete-nodes-zynqmp-zcu102-rev10-ad9361-fmcomms5.dtsi \
		file://pl-delete-nodes-zynqmp-zcu102-rev10-fmcdaq3.dtsi \
		file://pl-delete-nodes-zynqmp-zcu102-hdl-adrv9009.dtsi \
		file://pl-delete-nodes-zynqmp-zcu102-rev10-adrv9008-1-jesd204-fsm.dtsi \
		file://pl-delete-nodes-zynqmp-zcu102-rev10-adrv9008-2-jesd204-fsm.dtsi \
		file://pl-delete-nodes-zynqmp-zcu102-rev10-ad9172-fmc-ebz-mode4.dtsi \
		file://pl-delete-nodes-zynqmp-zcu102-rev10-ad9081-m8-l4.dtsi \
		file://pl-delete-nodes-zynqmp-zcu102-rev10-adrv9002.dtsi \
		file://pl-delete-nodes-zynqmp-zcu102-rev10-adrv9002-rx2tx2.dtsi \
		file://pl-delete-nodes-zynqmp-adrv9009-zu11eg-revb-adrv2crr-fmc-revb-jesd204-fsm.dtsi"

SRC_URI_append_microblaze = " \
		file://pl-delete-nodes-fmcdaq2.dtsi \
		file://pl-delete-nodes-kc705_fmcdaq2.dtsi \
		file://pl-delete-nodes-kc705_ad9467_fmc.dtsi \
		file://pl-delete-nodes-kc705_fmcomms2-3.dtsi \
		file://pl-delete-nodes-kc705_fmcjesdadc1.dtsi \
		file://pl-delete-nodes-kcu105_fmcdaq2.dtsi \
		file://pl-delete-nodes-kcu105_adrv9371x.dtsi \
		file://pl-delete-nodes-kcu105_fmcomms2-3.dtsi \
		file://pl-delete-nodes-vc707_fmcadc2.dtsi \
		file://pl-delete-nodes-vc707_fmcomms2-3.dtsi \
		file://pl-delete-nodes-vc707_fmcjesdadc1.dtsi \
		file://pl-delete-nodes-vc707_fmcadc5.dtsi"

python __anonymous() {
    if not d.getVar("KERNEL_DTB"):
        """this is a warn and not fatal because `petalinux-config --get-hw-description` is using
        recipetool to append recipes on the run. With fatal, that process would silently break if
        KERNEL_DTB is not defined at that point which is likely..."""
        bb.warn("KERNEL_DTB is not defined. Your build is likely to fail! \
Make sure to define it in a conf file...")
}
DTB_PL_DELETE ?= "pl-delete-nodes-${KERNEL_DTB}"

DTS_INCLUDE_PATH_zynq = "${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts"
DTS_INCLUDE_PATH_zynqmp = "${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/xilinx"
DTS_INCLUDE_PATH_microblaze = "${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts"
KERNEL_DTB_PATH ?= "${DTS_INCLUDE_PATH}"

# zynq has some corner case where this will be overwritten
DTB_TAG_FILE ?= "${DT_FILES_PATH}/system-top.dts"
# zynqMP has some corner cases where this will be overwritten
DTB_TAG_FILE_zynqmp ?= "${DTS_INCLUDE_PATH}/zynqmp-zcu102-revA.dts"

# Only used when FPGA_MANAGER is enabled. These are only some defaults. Note that, for example, for Microblaze
# vc707.dts won't be a good choice if your platform is based on kc705 for instance...
DTS_BASE_zynq ?= "${DTS_INCLUDE_PATH}/zynq-zc706"
DTS_BASE_zynqmp ?= "${DTS_INCLUDE_PATH}/zynqmp-zcu102-rev1.0"
DTS_BASE_microblaze ?= "${DTS_INCLUDE_PATH}/vc707"
DTS_OVERLAY ?= "pl-${KERNEL_DTB}-overlay.dtsi"
DTS_OVERLAY_PATH ?= "${WORKDIR}"
# Make sure that the kernel sources are available
do_configure[depends] += "virtual/kernel:do_configure"

# Important for the pre-processor
DEVICETREE_PP_FLAGS += " \
		-I${DTS_INCLUDE_PATH} \
		"
# For dtc
DEVICETREE_FLAGS += " \
		-i${DTS_INCLUDE_PATH} \
		"

# Based on the selected device tree, this function will:
#	copy the device tree to ${WORKDIR}/system-user.dtsi since it is the one included by the top level device tree.
#	overwrite the ${DT_FILES_PATH}/system-top.dts with the selected devicetree.
#	add the pl.dtsi so that IPs added to our reference designs are also included.
#	Add the /include "pl-delete-nodes-*" to remove all the duplicated labels between ADI device trees and pl.dtsi.
#	Include system-user.dtsi at the end of the devicetree so users can extend it.
do_configure_append() {
	local dtb_tag_file=${DTB_TAG_FILE}

	[ ! -e "${WORKDIR}/${DTB_PL_DELETE}.dtsi" ] && \
		{ bbfatal "Error: Could not find \"${DTB_PL_DELETE}.dtsi\" in \"${WORKDIR}\""; }

	# Used to see if the PL part is being compiled as an overlay! In that case, we cannot apply our normal workflow since it would fail!
	# We try to keep the approach used by petalinux here, which is, if you build your PL as an overlay, then you should just have a
	# base devicetree capable of booting the system as if no bitstream is present on the device...
	if grep -qse "/plugin/;" "${DT_FILES_PATH}/pl.dtsi"; then
		cp "${DTS_BASE}.dts" "${DT_FILES_PATH}/system-top.dts"
		if [ ! -e "${DTS_OVERLAY_PATH}/${DTS_OVERLAY}" ]; then
			bbwarn "PL is being built as an overlay but no user overlay was found! The default one generated by petalinux is being used..."
			return 0
		fi
		echo "/include/ \"${DTB_PL_DELETE}.dtsi\"" >> "${DT_FILES_PATH}/pl.dtsi"
		echo "#include \"${DTS_OVERLAY}\"" >> "${DT_FILES_PATH}/pl.dtsi"

		return 0
	fi

	[ ! -e "${KERNEL_DTB_PATH}/${KERNEL_DTB}.dts" ] && \
		{ bbfatal "Error: Could not find selected device tree:\"${KERNEL_DTB}.dts\" in:\"${KERNEL_DTB_PATH}\"!!"; }

	cp "${KERNEL_DTB_PATH}/${KERNEL_DTB}.dts" "${DT_FILES_PATH}/system-top.dts"

	# corner cases
	case "${KERNEL_DTB}" in
	"zynq-zc706-adv7511-fmcdaq3-revC")
		dtb_tag_file="${DTS_INCLUDE_PATH}/zynq-zc706-adv7511-fmcdaq3.dts"
		;;
	"zynq-adrv9361-z7035-bob-cmos")
		dtb_tag_file="${DTS_INCLUDE_PATH}/zynq-adrv9361-z7035-bob.dts"
		;;
	"zynq-adrv9364-z7020-bob-cmos")
		dtb_tag_file="${DTS_INCLUDE_PATH}/zynq-adrv9364-z7020-bob.dts"
		;;
	"zynq-zc706-adv7511-adrv9008-1-jesd204-fsm")
		dtb_tag_file="${DTS_INCLUDE_PATH}/zynq-zc706-adv7511-adrv9008-1.dts"
		;;
	"zynq-zc706-adv7511-adrv9008-2-jesd204-fsm")
		dtb_tag_file="${DTS_INCLUDE_PATH}/zynq-zc706-adv7511-adrv9008-2.dts"
		;;
	"zynq-zc706-adv7511-adrv9375-jesd204-fsm")
		dtb_tag_file="${DTS_INCLUDE_PATH}/zynq-zc706-adv7511-adrv9371.dts"
		;;
	"zynqmp-adrv9009-zu11eg-revb-adrv2crr-fmc-revb-jesd204-fsm")
		dtb_tag_file="${DTS_INCLUDE_PATH}/zynqmp-adrv9009-zu11eg-reva.dtsi"
		;;
	esac

	# The only way to make sure that the pl.dtsi + pl-delete-nodes logic is not breaking the selected
	# devicetree is to include pl.dtsi right after the devicetree tag. Hence, this logic is the first
	# thing to be included. If there are errors, then [most likely] the problem should be in the pl-delete-nodes
	# (or in the petalinux logic to autogenerate pl.dtsi).
	# FIXME: For projects where the top devicetree does not hold the tag, this process will directly change the
	# files on the fetched kernel tree. We should think of mechanism to avoid this or, at least, to bring the file
	# to it's default after we are done...
	if ! grep -qse "pl.dtsi" "${dtb_tag_file}"; then
		sed -i '0,/\/dts-v1\/;/s//&\n#include "pl.dtsi"/' "${dtb_tag_file}"
	fi
	echo "/include/ \"${DTB_PL_DELETE}.dtsi\"" >> "${DT_FILES_PATH}/pl.dtsi"
	# As it turns out, system-conf.dtsi has some autogenerated nodes that we can use. Specially, the chosen node since
	# petalinux automatically generates proper bootargs depending on the project configuration (eg: use initramfs or sdcard as rootfs).
	# This will make things work out of the box without having to care with uEnv.txt for instance. On the other hand, this file also
	# defines the qspi partitions which conflicts with our devicetrees. Hence, the next command removes the the &qspi node...
	sed -i '/&qspi/,/^$/d' "${DT_FILES_PATH}/system-conf.dtsi"
	# add the user dts extension
	echo "#include \"system-user.dtsi\"" >> "${DT_FILES_PATH}/system-top.dts"
}

