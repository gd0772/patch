#!/bin/sh

export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
export PATH=/opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/:$PATH

make -j5 Image dtbs modules LOCALVERSION=""
