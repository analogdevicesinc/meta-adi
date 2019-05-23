# set here all know defconfig files. They should depend
# on the target machine
KBUILD_DEFCONFIG_zynq ?= "zynq_xcomm_adv7511_defconfig"
KBUILD_DEFCONFIG_zynqmp ?= "adi_zynqmp_defconfig"
KBUILD_DEFCONFIG_microblaze ?= "adi_mb_defconfig"

KCONFIG_MODE ?= "alldefconfig"
