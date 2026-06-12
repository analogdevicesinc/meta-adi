# Enable kernel debug information

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://sbom-debug-info.cfg"
