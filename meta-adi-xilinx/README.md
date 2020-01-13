## META-ADI-XILINX

This is the Analog Devices yocto layer to make it easier to integrate ADI linux kernel, device trees and userspace utilities (eg: libiio) onto Xilinx SoC FPGA based systems.

### Dependencies

To add Analog devices tools (eg: libiio) the [meta-adi-core](https://github.com/analogdevicesinc/meta-adi/tree/master/meta-adi-core) has to be included. By default, when building [petalinux-user-image](https://github.com/analogdevicesinc/meta-adi/tree/master/meta-adi-xilinx/recipes-core/images/petalinux-user-image.bbappend), this layer is needed.

### Building with Petalinux

Xilinx based platforms use Petalinx SDK in order to customize, build and deploy Embedded Linux on their platforms. Petalinux is a set of tools which work on top of yocto making it easy to add extra custom layers. For more information on Petalinux and on how to install the SDK refer to the following links:

* [Petalinux User guide](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2018_3/ug1144-petalinux-tools-reference-guide.pdf)
* [Petalinux Wiki](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842250/PetaLinux)

**This layer supports:**

*  **Petalinux-v2018.3;**
*  **hdl_2019_r1 (see [hdl](https://github.com/analogdevicesinc/hdl/releases/tag/2019_r1)).**

To build a petalinux project using Analog Devices yocto layer, run:

```bash
source  <path-to-installed-PetaLinux>/settings.sh
petalinux-create -t project --template <PLATFORM> --name <PROJECT_NAME>, where <PLATFORM> is:
	* zynqMP (for UltraScale + MPSoC)
	* zynq (for Zynq)
	* microblaze (for MicroBlaze)
git clone https://github.com/analogdevicesinc/meta-adi.git
cd <path-to-project>
# Check the Building HDL link below
petalinux-config --get-hw-description=<path to hdf file>
# When running the previous command, a configuration menu will come up. Go to Yocto Settings->User layers and add the <path-to-meta-adi>/meta-adi-xilinx and <path-to-meta-adi>/meta-adi-core (Check the note below!!)
# After the configuration is done, go to <path-to-meta-adi>/recipes-bsp/device-tree and open the device-tree.bbappend file. In the file set the KERNEL_DTB variable to the one that fits your FPGA carrier and FMC card.
cd build
petalinux-build
```

>**IMPORTANT: Since this layer depends on meta-adi-core (because of userspace tools), it has to be included after meta-adi-core, otherwise `petalinux-config` will fail.**

To build a BOOT.bin for [Zynq](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842549/Zynq-7000+SoC) and [ZynqMP](https://www.xilinx.com/products/silicon-devices/soc/zynq-ultrascale-mpsoc.html) platforms run `petalinux-package --boot --fsbl --fpga --u-boot`.  The output file will be placed in `path-to-petalinux-project>/images/linux`. Finally, copy  BOOT.bin and image.ub (FIT image including kernel, device tree and iniramfs) to the boot partition of a SD card.

For [Microblaze](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842560/MicroBlaze) platforms the Xilinx System Debugger is used to run the linux kernel directly from memory. Run the following commands:

```
cd <path-to-petalinux-project>/images/linux
source <path-to-vivado-sdk>/settings64.sh
xsdb
# In the xsdb system debugger run
connect
run the command targets without any argument to see the available targets
targets <desired target number>
fpga -f system.bit
dow image.elf
con
```

> Notes:
>
>1. To build the desired hdf file refer to [Building HDL](https://wiki.analog.com/resources/fpga/docs/build).
>2. To run the produced image.elf (**for microblaze**) make sure that the Xilinx Vivado SDK is installed.
>3. For an overview of `xsdb` refer to [Xilinx System Debugger Overview](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2014_3/SDK_Doc/concepts/sdk_c_xsd_over.htm)
>4. Refer to  [Petalinux User guide](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2018_3/ug1144-petalinux-tools-reference-guide.pdf) for building a MCS boot file for Microblaze

For **Zynq** and **ZynqMP**, one might want to use a complete root filesystem instead of initramfs. To disable initramfs on petalinux:

```bash
cd <path-to-project>
petalinux-config
# On the config menu go to Image Packaging Configuration->Root filesystem type and select SD card
```

With this layer, the default root password is forced to **analog**, overwriting the Petalinux default one. Also note, that the mechanism used by Petalinux to change the password,`petalinux-config -c rootfs`, will no longer work since this layer always overwrites the chosen password. To keep the Petalinux default way go to `<path-to-meta-adi>/meta-adi-xilinx/recipes-cores/images/petalinux-user-image.bbappend` and comment the following lines:

```
EXTRA_USERS_PARAMS = "  \
	usermod -P analog root;"
```

### Extending the devicetree

To extend ADI devicetrees, the normal Petalinux method should be used. Hence, the `system-user.dtsi` file should be used. This file is located under `path-to-project/project-spec/meta-user/recipes-bsp/device-tree/files/`. There is also a `device-tree.bbappend` which automatically selects this file for the build. With this mind, one can either:

 1. Directly change this file with the new devicetree nodes;
 2. Create a new file and add a `#include` or `/include/`directive in `system-user.dtsi`. In these case, changes to the `device-tree.bbappend` recipe are also needed.

### Offline Build

To build petalinux without internet access, run `petalinux-config` and select `BB_NO_NETWORK`. Check [Xilinx Yocto Builds without an Internet Connection](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/60129817/Xilinx+Yocto+Builds+without+an+Internet+Connection) for more information.