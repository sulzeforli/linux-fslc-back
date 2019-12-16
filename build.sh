#!/bin/sh
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
make distclean
make imx_mx6dsysd_defconfig
make menuconfig
make all -j8
make zImage

