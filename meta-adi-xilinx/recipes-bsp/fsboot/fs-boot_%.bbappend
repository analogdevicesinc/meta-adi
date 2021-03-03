# there's an issue in petalinux for microblaze designs using the uartlite core.
# we need to force it here so that xilinx tools do not complain about missing settings.
FSBOOT_CONSOLE_STDIN ?= "axi_uart"
FSBOOT_CONSOLE_STDOUT ?= "axi_uart"
YAML_SERIAL_CONSOLE_STDIN_forcevariable = "${FSBOOT_CONSOLE_STDIN}"
YAML_SERIAL_CONSOLE_STDOUT_forcevariable = "${FSBOOT_CONSOLE_STDOUT}"

