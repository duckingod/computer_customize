#!/usr/bin/env bash
mount /dev/cdrom /media/cdrom
apt-get install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r)
/media/cdrom/VBoxLinuxAdditions.run
