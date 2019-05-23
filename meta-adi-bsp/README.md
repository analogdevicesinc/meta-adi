## META-ADI-BSP

This is the Analog Devices yocto layer to make it easy to integrate ADI linux kernel, device trees and other BSP related utilities in your custom yocto machine.

**This layer is compatible with yocto sumo, thud and warrior!**


### Including it in your yocto build

To include this layer on your yocto build, you just have to add it to your `bblayers.conf` file as for any other layer.

### ADI kernel

As for now, this layer is not defining any  machine configuration, since all the supported machines are already implemented in another yocto layers. So, to use ADI kernel you should add the following line to your `local.conf` file:

```bash
PREFERRED_PROVIDER_virtual/kernel = "linux-adi"
```

or to use ADI master branch:

```bash
PREFERRED_PROVIDER_virtual/kernel = "linux-adi-dev"
```

If you are defining your own custom machine, you should add one of the above lines to your machine configuration file. Also, you should append linux-adi recipe to add your machine to the list of `COMPATIBLE_MACHINE`, since linux-adi recipe is setting this variable to the list of machines supported by it. Bellow, is an example of how linux-adi recipe can be extended (with normal yocto procedure with bbappend recipes) to support a custom machine:

```bash
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://defconfig"

COMPATIBLE_MACHINE += "|${MACHINE}"
```

Note that the above example, assumes that you have a working, out of tree, defconfig file to be used with ADI kernel. If one of the ADI, in tree, defconfig files is enough, the above recipe can be simplified to:

```bash
COMPATIBLE_MACHINE += "|${MACHINE}"
KBUILD_DEFCONFIG_${MACHINE} ?= "${adi_defconfig_file}"
```

You can see the list of supported machines in `recipes-kernel/linux/linux-adi.inc`, and the default defconfig files (for the supported machines) in `recipes-kernel/linux/linux-adi-configs.inc`.

The linux-adi recipe will also compile all the device trees which are supported for the machine being built with yocto.