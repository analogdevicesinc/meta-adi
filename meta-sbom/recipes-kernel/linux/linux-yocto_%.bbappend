# Enable kernel debug information

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://sbom-debug-info.cfg"
SRC_URI += "file://0001-demo-sbom-banner.patch"
