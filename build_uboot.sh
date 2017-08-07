#!/bin/sh

echo "Start compile Uboot-2017.07...."

make distclean

make skycui4412_config

if ! make -j4; then
	exit 1;
fi

echo "making BL2....."
#split -b 14336 spl/u-boot.bin bl2
split -b 14336 spl/skycui4412-spl.bin bl2
./chksum
	
echo "cat bl1+bl2 to u-boot-SKYCUI-4412.bin"
cat E4412.S.BL1.SSCR.EVT1.1.bin checksum_bl2_14k.bin all00_padding.bin u-boot.bin > u-boot-SKYCUI-4412.bin
	
rm bl2a*

echo "Compile finish!!"

