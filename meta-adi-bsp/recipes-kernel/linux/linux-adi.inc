SECTION = "kernel"
DESCRIPTION = "Linux kernel for ADI platforms"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit kernel
inherit kernel-yocto

KBRANCH ?= "2018_R2"
# Default to latest revision
SRCREV ?= "${AUTOREV}"

PV = "${LINUX_VERSION}-${LINUX_RELEASE}+git${SRCPV}"

SRC_URI = "git://github.com/analogdevicesinc/linux.git;protocol=https;branch=${KBRANCH}"

S = "${WORKDIR}/git"

# only allow known compatible machines
COMPATIBLE_MACHINE = "microblaze|zynq|zynqmp"
KMACHINE ?= "${MACHINE}"

require linux-adi-configs.inc

# add extra tasks (taken from linux-yocto.inc)
addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
addtask kernel_configcheck after do_configure before do_compile
