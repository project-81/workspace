DEVICE=/dev/sdb

# /etc/udev/rules.d

# udevadm control --reload-rules

udevadm info -a -n $DEVICE | less
