#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/bos.kernel isodir/boot/bos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "bos" {
	multiboot /boot/bos.kernel
}
EOF
grub-mkrescue -o bos.iso isodir
