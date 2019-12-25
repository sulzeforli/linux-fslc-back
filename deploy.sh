#!/bin/sh
cp arch/arm/boot/zImage ~/Workspace/i.MX/deploy/
cp arch/arm/boot/dts/mx6dsysd.dtb ~/Workspace/i.MX/deploy/
cp .config arch/arm/configs/imx_mx6dsysd_defconfig
cp arch/arm/configs/imx_mx6dsysd_defconfig ~/Workspace/i.MX/deploy/

