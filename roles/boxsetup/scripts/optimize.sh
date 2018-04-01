#!/bin/bash -eux

# @Author: Haupt Joshua <HauptJ>
# @Date:   15-Mar-2018
# @Email:  josh@hauptj.com
# @Filename: optimize.sh
# @Last modified by:   HauptJ
# @Last modified time: 01-Apr-2018


# try to deal with broken centos UEFI in Hyper-V
# Source: https://github.com/marcinbojko/hv-packer/blob/master/extra/files/gen2-centos/uefi.sh

# Let's find out which bootnumber we have currently in UEFI with CentOS label
bootnum=`efibootmgr -v|grep -i centos|awk '{print $1}'|cut -c5-8`

if [ -d "/boot/efi/EFI/centos" ]; then
    echo "Centos exists"
    # cp -av /boot/efi/EFI/centos/. /boot/efi/EFI/BOOT/
    # now centos exists
    if [ -z "$bootnum" ]; then
        echo "Current CentOS boot number equals:" $bootnum
        efibootmgr -b $bootnum -B
        efibootmgr --create --label CentOS --disk /dev/sda1 --loader "\EFI\centos\shim.efi"
        sudo grub2-mkconfig -o /boot/efi/EFI/BOOT/grub.cfg
        efibootmgr -v
    fi
fi

# Disable CentOS disk IO scheduler
# Prevents conflict with HV disk IO scheduler
echo noop >> /sys/block/sda/queue/scheduler
