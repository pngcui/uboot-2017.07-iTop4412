#!/bin/sh

echo "Start compile Uboot-2017.07...."

sec_path="CodeSign4SecureBoot/"
ROOT_DIR=$(pwd)

make distclean

make skycui4412_config

if ! make -j4; then
	exit 1;
fi

echo "Start make bl2...."

./mkbl2 spl/skycui4412-spl.bin bl2.bin 14336

echo "Start cat u-boot...."
cp -rf u-boot.bin $sec_path
cp -rf bl2.bin $sec_path

cd $sec_path

#cat E4412.S.BL1.SSCR.EVT1.1.bin E4412.BL2.TZ.SSCR.EVT1.1.bin all00_padding.bin u-boot.bin E4412.TZ.SSCR.EVT1.1.bin > u-boot-SKYCUI-4412.bin
cat E4412_N.bl1.bin bl2.bin all00_padding.bin u-boot.bin > u-boot-SKYCUI-4412.bin

mv u-boot-SKYCUI-4412.bin $ROOT_DIR

rm u-boot.bin

echo "Compile finish!!"

