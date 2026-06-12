SUMMARY = "Pre-built kernel image fetched from Cloudsmith (S3)"
LICENSE = "GPL-2.0-only"

PROVIDES  = "virtual/kernel"
RPROVIDES:${PN} = "virtual/kernel"

SRC_URI = "https://dl.cloudsmith.io/public/adi/linux/raw/versions/e1105fded70a2f3d225087f9c9dc168c6f625da4/adi_bcmrpi_defconfig-gcc-arm;downloadfilename=adi-kernel.zip"
SRC_URI[sha256sum] = "25eda28cd87f831cb041b04f931e8a1819272483f2aec0b1d7be9f94ec389aa4"

KERNEL_IMAGETYPE = "zImage"

inherit deploy

# Nothing to configure or compile
do_configure[noexec] = "1"
do_compile[noexec]   = "1"

do_install() {
    install -d ${D}/boot
    install -m 0644 ${WORKDIR}/boot/zImage ${D}/boot/zImage

    install -d ${D}/lib/modules
    cp -a ${WORKDIR}/lib/modules/. ${D}/lib/modules/
}

do_deploy() {
    install -d ${DEPLOYDIR}
    install -m 0644 ${WORKDIR}/boot/zImage ${DEPLOYDIR}/zImage
}
addtask deploy before do_build after do_install

FILES:${PN}         = "/boot"
FILES:${PN}-modules = "/lib/modules"
PACKAGES =+ "${PN}-modules"
