FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# this append recipe is intended to fix lsb_base in the
# iiod service. The iiod sysV script is calling functions
# (status_of_proc, log_daemon_msg) which are not implemented
# in the openembedded lsb recipe used by petalinux.

SRC_URI += "file://lsb_init.patch;patchdir=${WORKDIR} \
		file://lsb_status"

do_install_append() {
	install -m 0755 ${WORKDIR}/lsb_status ${D}${sysconfdir}/core-lsb
}
