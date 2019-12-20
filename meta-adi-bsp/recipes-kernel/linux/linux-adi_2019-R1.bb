LINUX_VERSION = "4.14"
LINUX_RELEASE = "2019_R1"

KBRANCH = "2019_R1"

# Device trees for zc706 platforms
KERNEL_DEVICETREE_zc706-zynq7 += " \
			zynq-zc706-adv7511-ad6676-fmc.dtb \
			zynq-zc706-adv7511-ad9136-fmc-ebz.dtb \
			zynq-zc706-adv7511-ad9265-fmc-125ebz.dtb \
			zynq-zc706-adv7511-ad9361-4-fmcomms2-3-4-userspace.dtb \
			zynq-zc706-adv7511-ad9361-fmcomms2-3.dtb \
			zynq-zc706-adv7511-ad9361-fmcomms5.dtb \
			zynq-zc706-adv7511-ad9361-fmcomms5-ext-lo-adf5355.dtb \
			zynq-zc706-adv7511-ad9361-fmcomms5-userspace.dtb \
			zynq-zc706-adv7511-ad9364-fmcomms4.dtb \
			zynq-zc706-adv7511-ad9434-fmc-500ebz.dtb \
			zynq-zc706-adv7511-ad9625-fmcadc2.dtb \
			zynq-zc706-adv7511-ad9625-fmcadc3.dtb \
			zynq-zc706-adv7511-ad9625-fmcadc7.dtb \
			zynq-zc706-adv7511-ad9739a-fmc.dtb \
			zynq-zc706-adv7511-adrv9009.dtb \
			zynq-zc706-adv7511-adrv9363.dtb \
			zynq-zc706-adv7511-adrv9371.dtb \
			zynq-zc706-adv7511-adrv9375.dtb \
			zynq-zc706-adv7511.dtb \
			zynq-zc706-adv7511-fmcadc4.dtb \
			zynq-zc706-adv7511-fmcdaq1.dtb \
			zynq-zc706-adv7511-fmcdaq2.dtb \
			zynq-zc706-adv7511-fmcdaq3.dtb \
			zynq-zc706-adv7511-fmcdaq3-revC.dtb \
			zynq-zc706-adv7511-fmcjesdadc1.dtb \
			zynq-zc706-adv7511-fmcomms11.dtb \
			zynq-zc706-adv7511-fmcomms11-RevA.dtb \
			zynq-zc706-adv7511-fmcomms1.dtb \
			zynq-zc706-adv7511-fmcomms6.dtb \
			zynq-zc706.dtb \
			zynq-zc706-imageon.dtb"

# Device trees for zc702 platforms
KERNEL_DEVICETREE_zc702-zynq7 += " \
			zynq-zc702-adv7511-ad9361-4-fmcomms2-3-4-userspace.dtb \
			zynq-zc702-adv7511-ad9361-fmcomms2-3.dtb \
			zynq-zc702-adv7511-ad9361-fmcomms5.dtb \
			zynq-zc702-adv7511-ad9361-fmcomms5-userspace.dtb \
			zynq-zc702-adv7511-ad9364-fmcomms4.dtb \
			zynq-zc702-adv7511-adrv9363.dtb \
			zynq-zc702-adv7511.dtb \
			zynq-zc702-adv7511-fmcomms1.dtb \
			zynq-zc702.dtb"

# Device trees for zed platforms
KERNEL_DEVICETREE_zedboard-zynq7 += " \
			zynq-zed-adf7242.dtb \
			zynq-zed-adv7511-ad4020.dtb \
			zynq-zed-adv7511-ad5593r.dtb \
			zynq-zed-adv7511-ad7768.dtb \
			zynq-zed-adv7511-ad9361-4-fmcomms2-3-4-userspace.dtb \
			zynq-zed-adv7511-ad9361-fmcomms2-3.dtb \
			zynq-zed-adv7511-ad9364-fmcomms4.dtb \
			zynq-zed-adv7511-ad9467-fmc-250ebz.dtb \
			zynq-zed-adv7511-adrv9363.dtb \
			zynq-zed-adv7511-cn0363.dtb \
			zynq-zed-adv7511-display-rotary-test.dtb \
			zynq-zed-adv7511.dtb \
			zynq-zed-adv7511-fmcmotcon2.dtb \
			zynq-zed-adv7511-fmcomms1.dtb \
			zynq-zed-adv7511-imageon-loopback.dtb \
			zynq-zed-adv7511-pmod-ad1-da1.dtb \
			zynq-zed.dtb \
			zynq-zed-imageon.dtb \
			zynq-zed-seps525.dtb"

# Device trees for zcu102 platforms
KERNEL_DEVICETREE_zcu102-zynqmp.conf += " \
			zynqmp-zcu102-rev10-ad9361-fmcomms2-3.dtb \
			zynqmp-zcu102-rev10-ad9361-fmcomms5.dtb \
			zynqmp-zcu102-rev10-ad9361-fmcomms5-ext-lo-adf5355.dtb \
			zynqmp-zcu102-rev10-ad9364-fmcomms4.dtb \
			zynqmp-zcu102-rev10-adrv9008-1.dtb \
			zynqmp-zcu102-rev10-adrv9008-2.dtb \
			zynqmp-zcu102-rev10-adrv9009.dtb \
			zynqmp-zcu102-rev10-adrv9371.dtb \
			zynqmp-zcu102-rev10-adrv9375.dtb \
			zynqmp-zcu102-rev1.0.dtb \
			zynqmp-zcu102-rev10-fmcdaq2.dtb \
			zynqmp-zcu102-rev10-fmcdaq3.dtb \
			zynqmp-zcu102-revA.dtb \
			zynqmp-zcu102-revB-ad9361-fmcomms2-3.dtb \
			zynqmp-zcu102-revB-ad9364-fmcomms4.dtb \
			zynqmp-zcu102-revB-adrv9363.dtb \
			zynqmp-zcu102-revB.dtb"

# Device trees for zcu104 platforms
KERNEL_DEVICETREE_zcu104-zynqmp += " \
			zynqmp-zcu104-revA.dtb \
			zynqmp-zcu104-revC.dtb"

# Device trees for zcu106 platforms
KERNEL_DEVICETREE_zcu106-zynqmp += " \
			zynqmp-zcu106-revA.dtb"

# Device trees for kc705 platforms
KERNEL_DEVICETREE_kc705-microblazeel += " \
			kc705_ad9467_fmc.dtb \
			kc705_fmcdaq2.dtsb \
			kc705_fmcjesdadc1.dtb \
			kc705_fmcomms1.dtb \
			kc705_fmcomms2-3.dtb \
			kc705_fmcomms4.dtb"

require linux-adi.inc
