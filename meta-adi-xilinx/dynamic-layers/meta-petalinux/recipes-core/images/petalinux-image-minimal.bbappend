IMAGE_INSTALL:append = " libiio  \
			 libiio-tests \
			 libiio-iiod \
			 libiio-python3 \
			 pyadi-iio \
			 avahi-daemon \
			 fru-tools \
			 libad9361-iio \
			 jesd-status \
			 adrv9009-zu11eg-fan-control"

IMAGE_INSTALL:remove:microblaze = "avahi-daemon pyadi-iio"

# fsboot fails to build in vc707 and kc705 based projects. This is a petalinux bug or
# something missing in our hdl projects that petalinux is expecting to exist. Anyways,
# we never really used fsboot as part of our workflow and, AFAIK, no one is really
# using it. Hence just don't build it. If someone raises his hand, we can then dig further.
EXTRA_IMAGEDEPENDS:remove:microblaze = "virtual/fsboot"

# Mimic what petalinux is doing in petalinux.conf. The big difference is that the user is
# called analog instead of petalinux. Also, we just set 'analog' as the root password to
# make things simpler and more in sync with kuiper. Otherwise, we would need to check when
# debug-tweaks is part of IMAGE_FEATURES to force the password to 'analog'.
# One thing that differs from kuiper is that auto login and root ssh connection are not
# enabled by default. Use 'petalinux-config -c rootfs' for that.
#
# This behaviour can be reverted by adding following lines to petalinuxbsp.conf:
# - KUIPER_COMPAT_USERADD = ""
# - KUIPER_COMPAT_SUDOERS = ""
KUIPER_COMPAT_USERADD ??= "	\
	useradd -p '\$6\$xx\$OCk/lHkXahf1zu7kG4wzEic75NlaPVNtK8uwW3Ytjas229MmjVA.x/WFjQMIOFrlO.OQUc0KGyVzr8h3nwfWi1' analog; \
	usermod -p '\$6\$xx\$OCk/lHkXahf1zu7kG4wzEic75NlaPVNtK8uwW3Ytjas229MmjVA.x/WFjQMIOFrlO.OQUc0KGyVzr8h3nwfWi1' root; \
	usermod -a -G audio analog; \
	usermod -a -G video analog; \
	groupadd -r aie; \
	usermod -a -G aie analog; \
"
KUIPER_COMPAT_SUDOERS ??= "analog ALL=(ALL) ALL;"
EXTRA_USERS_PARAMS:append = "${KUIPER_COMPAT_USERADD}"
EXTRA_USERS_SUDOERS:append = "${KUIPER_COMPAT_SUDOERS}"
