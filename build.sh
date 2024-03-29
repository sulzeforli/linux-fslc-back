#!/bin/sh
export ARCH=arm
export SDKTARGETSYSROOT=/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/cortexa9hf-neon-poky-linux-gnueabi
export PATH=/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/usr/bin:/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/usr/sbin:/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/bin:/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/sbin:/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/usr/bin/../x86_64-pokysdk-linux/bin:/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi:/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-uclibc:/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-musl:$PATH
export CCACHE_PATH=/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/usr/bin:/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/usr/bin/../x86_64-pokysdk-linux/bin:/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi:/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-uclibc:/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-musl:$CCACHE_PATH
export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT
export PKG_CONFIG_PATH=$SDKTARGETSYSROOT/usr/lib/pkgconfig:$SDKTARGETSYSROOT/usr/share/pkgconfig
export CONFIG_SITE=/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/site-config-cortexa9hf-neon-poky-linux-gnueabi
export OECORE_NATIVE_SYSROOT="/home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux"
export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"
export OECORE_ACLOCAL_OPTS="-I /home/dzd/Qt/5.9.8/Boot2Qt/imx6qsabresd/toolchain/sysroots/x86_64-pokysdk-linux/usr/share/aclocal"
unset command_not_found_handle
export CC="arm-poky-linux-gnueabi-gcc  -march=armv7-a -marm -mfpu=neon  -mfloat-abi=hard -mcpu=cortex-a9 --sysroot=$SDKTARGETSYSROOT"
export CXX="arm-poky-linux-gnueabi-g++  -march=armv7-a -marm -mfpu=neon  -mfloat-abi=hard -mcpu=cortex-a9 --sysroot=$SDKTARGETSYSROOT"
export CPP="arm-poky-linux-gnueabi-gcc -E  -march=armv7-a -marm -mfpu=neon  -mfloat-abi=hard -mcpu=cortex-a9 --sysroot=$SDKTARGETSYSROOT"
export AS="arm-poky-linux-gnueabi-as "
export LD="arm-poky-linux-gnueabi-ld  --sysroot=$SDKTARGETSYSROOT"
export GDB=arm-poky-linux-gnueabi-gdb
export STRIP=arm-poky-linux-gnueabi-strip
export RANLIB=arm-poky-linux-gnueabi-ranlib
export OBJCOPY=arm-poky-linux-gnueabi-objcopy
export OBJDUMP=arm-poky-linux-gnueabi-objdump
export AR=arm-poky-linux-gnueabi-ar
export NM=arm-poky-linux-gnueabi-nm
export M4=m4
export TARGET_PREFIX=arm-poky-linux-gnueabi-
export CONFIGURE_FLAGS="--target=arm-poky-linux-gnueabi --host=arm-poky-linux-gnueabi --build=x86_64-linux --with-libtool-sysroot=$SDKTARGETSYSROOT"
export CFLAGS=" -O2 -pipe -g -feliminate-unused-debug-types "
export CXXFLAGS=" -O2 -pipe -g -feliminate-unused-debug-types "
export LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed"
export CPPFLAGS=""
export KCFLAGS="--sysroot=$SDKTARGETSYSROOT"
export OECORE_DISTRO_VERSION="2.2.4"
export OECORE_SDK_VERSION="2.2.4"
export ARCH=arm
export CROSS_COMPILE=arm-poky-linux-gnueabi-
make distclean
make imx_mx6dsysd_defconfig
make menuconfig
make all -j8
make zImage

