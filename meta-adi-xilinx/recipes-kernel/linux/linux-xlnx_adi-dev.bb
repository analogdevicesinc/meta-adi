LINUX_VERSION = "4.19"
ADI_VERSION = "adi_master"
KBRANCH = "master"
# needed for offline build
SRCREV = "${@ "cc28af1e4e1d9a2deccbad98c6da51f83e52bef5" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
require linux-adi.inc

# Override LIC_FILES_CHKSUM since the one used by yocto (in this petalinux
# version) corresponds to kernel 4.14 which would trigger a build failure.
LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
