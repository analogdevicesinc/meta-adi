FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_microblaze = " file://python_microblaze_fix.patch"
