LINUX_VERSION = "4.14"
ADI_VERSION = "adi_2018"
KBRANCH = "2018_R2"

# needed for offline build
SRCREV = "${@ "6dca1ea1d227fa170df307998963bb5fe8f5e2b2" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
require linux-adi.inc
