LINUX_VERSION = "4.14"
ADI_VERSION = "adi_2019"
KBRANCH = "2019_R1"

# needed for offline build
SRCREV = "${@ "abfd28fb5f9d88b5888809c7c80c7f404186b23b" if bb.utils.to_boolean(d.getVar('BB_NO_NETWORK')) else d.getVar('AUTOREV')}"
require linux-adi.inc
