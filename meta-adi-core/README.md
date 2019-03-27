## META-ADI-CORE

This layer is intended to contain all the core/common recipes and classes for all Analog Devices software packages. The purpose is for all the common recipes, which might be used in more than one layer in [meta-adi](https://github.com/analogdevicesinc/meta-adi), to be placed here.


### Usage with yocto

To use this layer with yocto, just make sure to include it's path to the `BBLAYERS` variable in `<path-to-yocto-build-dir>/conf/bblayers.conf`.