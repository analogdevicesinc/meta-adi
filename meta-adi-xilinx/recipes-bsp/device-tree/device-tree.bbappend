FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:zynq = " \
		file://pl-delete-nodes-zynq-zed-adv7511-ad9361-fmcomms2-3.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9434-fmc-500ebz.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-fmcdaq2.dtsi \
		file://pl-delete-nodes-zynq-zed-adv7511.dtsi \
		file://pl-delete-nodes-zynq-zed-adv7511-ad9467-fmc-250ebz.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-adrv9009.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-adrv9371.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad6676-fmc.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9265-fmc-125ebz.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9361-fmcomms2-3.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9361-fmcomms5.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-fmcomms11.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-fmcdaq3-revC.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-adrv9008-1-jesd204-fsm.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-adrv9008-2-jesd204-fsm.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9172-fmc-ebz.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-adrv9375-jesd204-fsm.dtsi \
		file://pl-delete-nodes-zynq-zc706-adv7511-ad9081.dtsi \
		file://pl-delete-nodes-zynq-zed-adv7511-adrv9002.dtsi \
		file://pl-delete-nodes-zynq-zed-adv7511-adrv9002-rx2tx2.dtsi \
		file://pl-delete-nodes-zynq-zed-adv7511-ad4630-24.dtsi \
		file://pl-delete-nodes-zynq-adrv9361-z7035-bob-cmos.dtsi \
		file://pl-delete-nodes-zynq-adrv9361-z7035-bob.dtsi \
		file://pl-delete-nodes-zynq-adrv9361-z7035-fmc.dtsi \
		file://pl-delete-nodes-zynq-adrv9364-z7020-bob-cmos.dtsi \
		file://pl-delete-nodes-zynq-adrv9364-z7020-bob.dtsi \
		file://pl-delete-nodes-zynq-zc702-adv7511-ad9361-fmcomms5.dtsi \
		file://pl-delete-nodes-zynq-zc702-adv7511.dtsi"

SRC_URI:append:zynqmp = " \
		file://pl-zynqmp-zcu102-rev10-ad9361-fmcomms2-3-overlay.dtsi \
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
		file://pl-delete-nodes-zynqmp-adrv9009-zu11eg-revb-adrv2crr-fmc-revb-jesd204-fsm.dtsi \
		file://pl-delete-nodes-zynqmp-zcu102-rev10-adrv9025.dtsi \
		file://pl-delete-nodes-zynqmp-adrv9009-zu11eg-revb-adrv2crr-fmc-revb-sync-fmcomms8-jesd204-fsm.dtsi \
		file://pl-delete-nodes-zynqmp-jupiter-sdr.dtsi \
		file://pl-delete-nodes-zynqmp-jupiter-sdr-rx2tx2.dtsi"

SRC_URI:append:microblaze = " \
		file://pl-delete-nodes-fmcdaq2.dtsi \
		file://pl-delete-nodes-kc705_fmcdaq2.dtsi \
		file://pl-delete-nodes-kc705_ad9467_fmc.dtsi \
		file://pl-delete-nodes-kc705_fmcomms2-3.dtsi \
		file://pl-delete-nodes-kcu105_fmcdaq2.dtsi \
		file://pl-delete-nodes-kcu105_adrv9371x.dtsi \
		file://pl-delete-nodes-kcu105_fmcomms2-3.dtsi \
		file://pl-delete-nodes-vc707_fmcomms2-3.dtsi \
		file://pl-delete-nodes-vcu118_ad9081_m8_l4.dtsi"

SRC_URI:append:versal = " \
		file://pl-delete-nodes-versal-vck190-reva-ad9081.dtsi \
		file://pl-delete-nodes-versal-vck190-reva-ad9081-204c-txmode22-rxmode23.dtsi \
		file://pl-delete-nodes-versal-vck190-reva-ad9082-204c-txmode22-rxmode23.dtsi"

python __anonymous() {
    if not d.getVar("KERNEL_DTB"):
        """this is a warn and not fatal because `petalinux-config --get-hw-description` is using
        recipetool to append recipes on the run. With fatal, that process would silently break if
        KERNEL_DTB is not defined at that point which is likely..."""
        bb.warn("KERNEL_DTB is not defined. Your build is likely to fail! \
Make sure to define it in a conf file...")
}
DTB_PL_DELETE ?= "pl-delete-nodes-${KERNEL_DTB}"

DTS_INCLUDE_PATH = "${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/xilinx"
DTS_INCLUDE_PATH:microblaze = "${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts"

# can be set to "n", if we do not use in kernel devicetrees and hence, we do not need to copy them to ${WORKDIR}.
# it naturally implies ${KERNEL_DTB_PATH} != ${DTS_INCLUDE_PATH}
USE_KERNEL_SOURCES ?= "y"
KERNEL_DTB_PATH ?= "${DTS_INCLUDE_PATH}"

# zynq has some corner case where this will be overwritten
DTB_TAG_FILE ?= "${DT_FILES_PATH}/system-top.dts"
# zynqMP has some corner cases where this will be overwritten
DTB_TAG_FILE:zynqmp ?= "${WORKDIR}/zynqmp-zcu102-revA.dts"
DTB_TAG_FILE:versal ?= "${WORKDIR}/versal.dtsi"

# Only used when FPGA_MANAGER is enabled. These are only some defaults. Note that, for example, for Microblaze
# vc707.dts won't be a good choice if your platform is based on kc705 for instance...
DTS_BASE:zynq ?= "${DTS_INCLUDE_PATH}/zynq-zc706"
DTS_BASE:zynqmp ?= "${DTS_INCLUDE_PATH}/zynqmp-zcu102-rev1.0"
DTS_BASE:microblaze ?= "${DTS_INCLUDE_PATH}/vc707"
DTS_BASE:versal ?= "${DTS_INCLUDE_PATH}/versal-vck190-revA"
DTS_OVERLAY ?= "pl-${KERNEL_DTB}-overlay.dtsi"
DTS_OVERLAY_PATH ?= "${WORKDIR}"
# Make sure that the kernel sources are available
do_configure[depends] += "virtual/kernel:do_configure"

# Remove this path from being included as it was conflicting with our internal devicetrees.
# Moreover, the order by which the include paths are given to dtc looks to be random and changes
# from build to build. Hence, for some projects (eg: kcu105_adrv9371x), whenever this path was
# given first, the build was failing since there are "colliding" .dtsi files and the ones given
# by xilinx make some assumptions about node names that are not true for every devicetree
# (including our owns).
DT_INCLUDE:remove:microblaze = "${S}/device_tree/data/kernel_dtsi/${DT_RELEASE_VERSION}/BOARD/"
# The dt-bindings includes were conflicting with the zyznqmp.dtsi header that comes from ADI kernel
# (which is the same as in linux-xlnx). For some reason, there are some differences for petalinux in
# that header when compared with what xilinx has in the linux tree. More specifically, the remoteproc
# node is not defined in petalinux and hence PD_RPU_0 is not define in the bindings headers
# (brought by petalinux) leading to compilation errors. Hence, remove this path as we want,
# as much as possible, to have similar results between building with petalinux or building in source in
# the ADI kernel tree.
DT_INCLUDE:remove:zynqmp = "${S}/device_tree/data/kernel_dtsi/${DT_RELEASE_VERSION}/include/"

# Based on the selected device tree, this function will:
#	copy the device trees of interest to ${WORKDIR}.
#	overwrite the ${DT_FILES_PATH}/system-top.dts with the selected devicetree.
#	add the pl.dtsi so that IPs added to our reference designs are also included.
#	Add the /include "pl-delete-nodes-*" to remove all the duplicated labels between ADI device trees and pl.dtsi.
#	Include system-user.dtsi at the end of the devicetree so users can extend it.
do_configure:append() {
	local dtb_tag_file=${DTB_TAG_FILE}

	[ ! -e "${WORKDIR}/${DTB_PL_DELETE}.dtsi" ] && \
		{ bbfatal "Error: Could not find \"${DTB_PL_DELETE}.dtsi\" in \"${WORKDIR}\""; }

	# Copy all the devicetrees to the local workdir. The goal is to apply our pl + pl-delete-nodes
	# logic on the $dtb_tag_file without directly changing the original file (being it an in kernel
	# devicetree or not). In case it's an in kernel devicetree, changing it would actually
	# break the kernel compilation
	[ "${USE_KERNEL_SOURCES}" = "y" ] && { \
		cp -Rf "${DTS_INCLUDE_PATH}/"* "${WORKDIR}/"
		# make sure to follow symlinks
		cp -Rfl "${STAGING_KERNEL_DIR}/scripts/dtc/include-prefixes/"* "${WORKDIR}/"
		# arm now also has vendor subfolders and we do have some DTs that are common to more
		# than one vendor and we include this using their relative path and just go back one directory. Hence,
		# we copy them to the parent directory of DT_FILES_PATH and remove them later after do_install
		[ "${ARCH}" = "arm" ] && cp ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/adi-*.dtsi "${DT_FILES_PATH}/.."
	}

	[ "${KERNEL_DTB_PATH}" != "${WORKDIR}" ] && \
		[ "${KERNEL_DTB_PATH}" != "${DTS_INCLUDE_PATH}" ] && cp -Rf "${KERNEL_DTB_PATH}/"* "${WORKDIR}/"


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
		dtb_tag_file="${WORKDIR}/zynq-zc706-adv7511-fmcdaq3.dts"
		;;
	"zynq-adrv9361-z7035-bob-cmos")
		dtb_tag_file="${WORKDIR}/zynq-adrv9361-z7035-bob.dts"
		;;
	"zynq-adrv9364-z7020-bob-cmos")
		dtb_tag_file="${WORKDIR}/zynq-adrv9364-z7020-bob.dts"
		;;
	"zynq-zc706-adv7511-adrv9008-1-jesd204-fsm")
		dtb_tag_file="${WORKDIR}/zynq-zc706-adv7511-adrv9008-1.dts"
		;;#
	"zynq-zc706-adv7511-adrv9008-2-jesd204-fsm")
		dtb_tag_file="${WORKDIR}/zynq-zc706-adv7511-adrv9008-2.dts"
		;;
	"zynq-zc706-adv7511-adrv9375-jesd204-fsm")
		dtb_tag_file="${WORKDIR}/zynq-zc706-adv7511-adrv9371.dts"
		;;
	"zynqmp-adrv9009-zu11eg-revb-adrv2crr-fmc-revb-jesd204-fsm" | \
	"zynqmp-adrv9009-zu11eg-revb-adrv2crr-fmc-revb-sync-fmcomms8-jesd204-fsm")
		dtb_tag_file="${WORKDIR}/zynqmp-adrv9009-zu11eg-reva.dtsi"
		;;
	"zynqmp-jupiter-sdr" | "zynqmp-jupiter-sdr-rx2tx2")
		dtb_tag_file="${DT_FILES_PATH}/system-top.dts"
		;;
	 "vcu118_ad9081_m8_l4")
		dtb_tag_file="${WORKDIR}/vcu118_ad9081.dts"
		;;
	esac

	# The only way to make sure that the pl.dtsi + pl-delete-nodes logic is not breaking the selected
	# devicetree is to include pl.dtsi right after the devicetree tag. Hence, this logic is the first
	# thing to be included. If there are errors, then [most likely] the problem should be in the pl-delete-nodes
	# (or in the petalinux logic to autogenerate pl.dtsi).
	sed -i '0,/\/dts-v1\/;/s//&\n#include "pl.dtsi"/' "${dtb_tag_file}"
	# Microblaze now generated a node also called amba_pl. This is a problem since we have a node with the same name
	# in our DTs. Hence just rename the petalinux generated node.
	[ ${ARCH} = "microblaze" ] && sed -i 's/amba_pl/amba_pl_xlnx/g' "${DT_FILES_PATH}/pl.dtsi"
	echo "/include/ \"${DTB_PL_DELETE}.dtsi\"" >> "${DT_FILES_PATH}/pl.dtsi"
	# Just remove all the nodes after the chosen node since it is the only one we care about in system-conf.
	# The next command makes some assumptions like the chosen node to be the only one defined in the root
	# node. Also, it assumes that the root node (hence the chosen) is the first node to be defined. AFAICT, this
	# is like this in all supported platforms but there are space to burn ourselves (as some non tested config
        # might change this). So, we need to keep an eye on this!
	sed -i -n '0,/^};/p' "${DT_FILES_PATH}/system-conf.dtsi"
	# add the user dts extension
	echo "#include \"system-user.dtsi\"" >> "${DT_FILES_PATH}/system-top.dts"
}

do_install:append:zynq() {
	rm -rf ${DT_FILES_PATH}/../adi-*.dtsi
}
