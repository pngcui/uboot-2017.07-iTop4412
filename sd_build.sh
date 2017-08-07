#!/bin/bash

if [ -z $1 ] 
then
	echo "usage: ./sd_build <SD Reader's device file>"
else
	
	echo "starting fuse uboot to TF..."
	partition1=/dev/$1"1"
    partition2=/dev/$1"2"
    partition3=/dev/$1"3"
    partition4=/dev/$1"4"
    
    umount $partition1 2> /dev/null
	umount $partition2 2> /dev/null
	umount $partition3 2> /dev/null
	umount $partition4 2> /dev/null
	
	echo "u-boot-SKYCUI-4412.bin fusing......................"
	dd iflag=dsync oflag=dsync if=u-boot-SKYCUI-4412.bin of=/dev/$1 seek=1
	echo "u-boot-SKYCUI-4412.bin image has been fused successfully."
	
	echo "Eject SD card"
fi
