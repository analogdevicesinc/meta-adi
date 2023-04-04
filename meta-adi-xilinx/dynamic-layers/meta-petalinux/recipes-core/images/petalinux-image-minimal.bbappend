IMAGE_INSTALL:append = " libiio  \
			 libiio-tests \
			 libiio-iiod \
			 libiio-python3 \
			 fru-tools \
			 libad9361-iio \
			 jesd-status \
			 adrv9009-zu11eg-fan-control"

# The petalinux default root password is root. To change it, one
# has to run petalinux-config -c rootfs and change the passoword. This lines below
# force the root password to be analog. To keep the petalinux way, just comment this lines...
EXTRA_USERS_PARAMS = "	\
	usermod -p '\$6\$xx\$OCk/lHkXahf1zu7kG4wzEic75NlaPVNtK8uwW3Ytjas229MmjVA.x/WFjQMIOFrlO.OQUc0KGyVzr8h3nwfWi1' root;"
