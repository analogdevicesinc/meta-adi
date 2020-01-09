LINUX_VERSION = "4.19"
ADI_VERSION = "adi_master"
KBRANCH = "master"

require linux-adi.inc

# Override LIC_FILES_CHKSUM since the one used by yocto (in this petalinux
# version) corresponds to kernel 4.14 which would trigger a build failure.
LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
