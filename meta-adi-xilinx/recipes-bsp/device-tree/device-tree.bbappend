FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += " \
	file://0001-fix-the-clock-frequency-generation.patch \
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
	file://pl-delete-nodes-zynq-zed-imageon.dtsi \
	file://pl-delete-nodes-zynq-adrv9361-z7035-bob-cmos.dtsi \
	file://pl-delete-nodes-zynq-adrv9361-z7035-bob.dtsi \
	file://pl-delete-nodes-zynq-adrv9361-z7035-fmc.dtsi \
	file://pl-delete-nodes-zynq-adrv9364-z7020-bob-cmos.dtsi \
	file://pl-delete-nodes-zynq-adrv9364-z7020-bob.dtsi \
	file://pl-delete-nodes-zynq-zc702-adv7511-ad9361-fmcomms5.dtsi \
	file://pl-delete-nodes-zynq-zc702-adv7511.dtsi \
	file://pl-delete-nodes-zynqmp-zcu102-rev10-adrv9009.dtsi \
	file://pl-delete-nodes-zynqmp-zcu102-rev10-fmcdaq2.dtsi \
	file://pl-delete-nodes-zynqmp-zcu102-rev10-adrv9371.dtsi \
	file://pl-delete-nodes-zynqmp-zcu102-rev10-ad9361-fmcomms2-3.dtsi \
	file://pl-delete-nodes-zynqmp-zcu102-rev10-ad9361-fmcomms5.dtsi \
	file://pl-delete-nodes-zynqmp-zcu102-rev10-fmcdaq3.dtsi \
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

# Set this variable with the desired device tree
# Supported device tree files
#  - For zynq platforms:
#	* zynq-zed-adv7511-ad9361-fmcomms2-3
#	* zynq-zc706-adv7511-ad9434-fmc-500ebz
#	* zynq-zc706-adv7511-fmcdaq2
#	* zynq-zed-adv7511
#	* zynq-zed-adv7511-ad9467-fmc-250ebz
#	* zynq-zc706-adv7511
#	* zynq-zc706-adv7511-adrv9009
#	* zynq-zc706-adv7511-adrv9371
#	* zynq-zc706-adv7511-ad6676-fmc
#	* zynq-zc706-adv7511-ad9739a-fmc
#	* zynq-zc706-adv7511-ad9625-fmcadc2
#	* zynq-zc706-adv7511-ad9265-fmc-125ebz
#	* zynq-zc706-adv7511-ad9361-fmcomms2-3
#	* zynq-zc706-adv7511-ad9361-fmcomms5
#	* zynq-zc706-adv7511-fmcdaq3-revC
#	* zynq-zc706-adv7511-fmcjesdadc1
#	* zynq-zc706-adv7511-fmcomms11
#	* zynq-zed-imageon
#	* zynq-zc702-adv7511-ad9361-fmcomms5
#	* zynq-zc702-adv7511
#	* zynq-adrv9361-z7035-bob-cmos
#	* zynq-adrv9361-z7035-bob
#	* zynq-adrv9364-z7020-bob-cmos
#	* zynq-adrv9364-z7020-bob
#	* zynq-adrv9361-z7035-fmc
#  - For zynqMP platforms:
#	* zynqmp-zcu102-rev10-adrv9009
#	* zynqmp-zcu102-rev10-fmcdaq2
#	* zynqmp-zcu102-rev10-adrv9371
#	* zynqmp-zcu102-rev10-ad9361-fmcomms2-3
#	* zynqmp-zcu102-rev10-ad9361-fmcomms5
#	* zynqmp-zcu102-rev10-fmcdaq3
#  - For microblaze platforms
#	* kc705_fmcdaq2
#	* kc705_ad9467_fmc
#	* kc705_fmcomms2-3
#	* kc705_fmcjesdadc1
#	* kcu105_fmcdaq2
#	* kcu105_adrv9371x
#	* kcu105_fmcomms2-3
#	* vc707_fmcadc2
#	* vc707_fmcomms2-3
#	* vc707_fmcjesdadc1
#	* vc707_fmcadc5
KERNEL_DTB = "zynq-zed-adv7511-ad9361-fmcomms2-3"

# used for sanity check
KERNEL_DTB_SUPPORTED_zynq = "zynq-zed-adv7511-ad9361-fmcomms2-3 \
			zynq-zc706-adv7511-ad9434-fmc-500ebz \
			zynq-zc706-adv7511-fmcdaq2 \
			zynq-zed-adv7511 \
			zynq-zed-adv7511-ad9467-fmc-250ebz \
			zynq-zc706-adv7511 \
			zynq-zc706-adv7511-adrv9009 \
			zynq-zc706-adv7511-adrv9371 \
			zynq-zc706-adv7511-ad6676-fmc \
			zynq-zc706-adv7511-ad9739a-fmc \
			zynq-zc706-adv7511-ad9625-fmcadc2 \
			zynq-zc706-adv7511-ad9265-fmc-125ebz \
			zynq-zc706-adv7511-ad9361-fmcomms2-3 \
			zynq-zc706-adv7511-ad9361-fmcomms5 \
			zynq-zc706-adv7511-fmcdaq3-revC \
			zynq-zc706-adv7511-fmcjesdadc1 \
			zynq-zc706-adv7511-fmcomms11 \
			zynq-zed-imageon \
			zynq-zc702-adv7511 \
			zynq-zc702-adv7511-ad9361-fmcomms5 \
			zynq-adrv9361-z7035-bob-cmos \
			zynq-adrv9361-z7035-bob \
			zynq-adrv9364-z7020-bob-cmos \
			zynq-adrv9364-z7020-bob \
			zynq-adrv9361-z7035-fmc"
KERNEL_DTB_SUPPORTED_zynqmp = "zynqmp-zcu102-rev10-adrv9009 \
			zynqmp-zcu102-rev10-fmcdaq2 \
			zynqmp-zcu102-rev10-adrv9371 \
			zynqmp-zcu102-rev10-ad9361-fmcomms2-3 \
			zynqmp-zcu102-rev10-ad9361-fmcomms5 \
			zynqmp-zcu102-rev10-fmcdaq3"
KERNEL_DTB_SUPPORTED_microblaze = "kc705_fmcdaq2 \
				kcu105_adrv9371x \
				kcu105_fmcdaq2 \
				kcu105_fmcomms2-3 \
				kc705_ad9467_fmc \
				kc705_fmcomms2-3 \
				kc705_fmcjesdadc1 \
				vc707_fmcadc2 \
				vc707_fmcomms2-3 \
				vc707_fmcjesdadc1 \
				vc707_fmcadc5"

DTS_INCLUDE_PATH_zynq = "${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts"
DTS_INCLUDE_PATH_zynqmp = "${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/xilinx"
DTS_INCLUDE_PATH_microblaze = "${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts"

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
# set common variables
set_common_vars() {
	KERNEL_PL_DTB_FILE="${1}"
	KERNEL_DTB_VER_FILE="${2}"
}

# Make sure that the selected device tree is supported on the current ${MACHINE}
do_sanity_check() {

	local dtb=""
	local found="n"

	for dtb in ${KERNEL_DTB_SUPPORTED}; do
		[ "${dtb}" == "${KERNEL_DTB}" ] && { found="y"; break; }
	done

	[ "${found}" == "n" ] && { bbfatal "Selected dtb=\"${KERNEL_DTB}\" not supported for current machine=${MACHINE}. \
These are the supported device trees:\"${KERNEL_DTB_SUPPORTED}\"."; }

	return 0
}
addtask do_sanity_check after do_patch before do_create_yaml

# Based on the selected device tree, this function will:
#	copy the device tree to ${WORKDIR}/system-user.dtsi since it is the one included by the top level device tree.
#	In some case, we need to remove some /include/ linesto avoid duplication with the top level device tree used by petalinux.
#	Remove /dts-v1/ duplicated line.
#	Add the /include "pl-delete-nodes-*" to remove all the duplicated labels between ADI device trees and pl.dtsi (generated by petalinux).
do_configure_append() {

	if [ -e "${DTS_INCLUDE_PATH}/${KERNEL_DTB}.dts" ]; then
		cp "${DTS_INCLUDE_PATH}/${KERNEL_DTB}.dts" ${WORKDIR}/analog-devices.dtsi
	else
		bbfatal "Error: Could not find selected device tree:\"${KERNEL_DTB}.dts\" in the kernel sources:\"${DTS_INCLUDE_PATH}\"!!"
	fi

	[ ! -e "${WORKDIR}/pl-delete-nodes-${KERNEL_DTB}.dtsi" ] && \
		{ bbfatal "Error: Could not find \"pl-delete-nodes-${KERNEL_DTB}.dtsi\" in \"${WORKDIR}\""; }

	case ${MACHINE} in
		"plnx-zynq7")
			# zynq has some corner cases that must be taken into account
			if [ "${KERNEL_DTB}" == "zynq-zc706-adv7511-fmcdaq3-revC" ]; then
				dtb_ver_file="${DTS_INCLUDE_PATH}/zynq-zc706-adv7511-fmcdaq3.dts"
			elif [ "${KERNEL_DTB}" == "zynq-adrv9361-z7035-bob-cmos" ]; then
				dtb_ver_file="${DTS_INCLUDE_PATH}/zynq-adrv9361-z7035-bob.dts"
			elif [ "${KERNEL_DTB}" == "zynq-adrv9364-z7020-bob-cmos" ]; then
				dtb_ver_file="${DTS_INCLUDE_PATH}/zynq-adrv9364-z7020-bob.dts"
			else
				dtb_ver_file="${WORKDIR}/analog-devices.dtsi"
			fi
			set_common_vars pl-delete-nodes-${KERNEL_DTB}.dtsi "${dtb_ver_file}"
			[ -e "${DTS_INCLUDE_PATH}/zynq.dtsi" ] && {  \
				sed -i s,[/#]include.*\"zynq-7000.dtsi\",, "${DTS_INCLUDE_PATH}/zynq.dtsi"; }
		;;
		"plnx-zynqmp")
			set_common_vars pl-delete-nodes-${KERNEL_DTB}.dtsi "${DTS_INCLUDE_PATH}/zynqmp-zcu102-revA.dts"
			[ -e "${DTS_INCLUDE_PATH}/zynqmp-zcu102-revA.dts" ] && { \
				sed -i 's,[/#]include.*\"zynqmp.dtsi\",,;s,[/#]include.*\"zynqmp-clk-ccf.dtsi\",,' "${DTS_INCLUDE_PATH}/zynqmp-zcu102-revA.dts"; }
		;;
		"plnx-microblazeel")
			set_common_vars pl-delete-nodes-${KERNEL_DTB}.dtsi "${WORKDIR}/analog-devices.dtsi"
		;;
		*)
			bbfatal "ERROR: Unsupported machine:${MACHINE}"
		;;
	esac

	sed -i s,/dts-v1/\;,, "${KERNEL_DTB_VER_FILE}"
	# If for some reason the WORKDIR is not cleaned we don't want to have
	# multiple include lines for our dtsi file. We also remove system-conf
	# since it touches in nodes that our dts already touch.
	sed -i '/analog-devices.dtsi/d;/system-conf.dtsi/d' "${WORKDIR}/system-user.dtsi"
	echo -e "#include \"analog-devices.dtsi\"" | cat - ${WORKDIR}/system-user.dtsi > temp && mv temp ${WORKDIR}/system-user.dtsi
	echo -e "/include/ \"${KERNEL_PL_DTB_FILE}\"" | cat - ${WORKDIR}/analog-devices.dtsi > temp && mv temp ${WORKDIR}/analog-devices.dtsi
}

