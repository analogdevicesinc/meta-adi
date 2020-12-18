IMAGE_INSTALL_append = " libiio  \
			 libiio-tests \
			 libiio-iiod \
			 fru-tools \
			 libad9361-iio \
			 jesd-status \
			 adrv9009-zu11eg-fan-control"

# The petalinux default root password is root. To change it, one
# has to run petalinux-config -c rootfs and change the passoword. This lines below
# force the root password to be analog. To keep the petalinux way, just comment this lines...
EXTRA_USERS_PARAMS = "	\
	usermod -P analog root;"
