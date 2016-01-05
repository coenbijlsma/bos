KERNEL=./bos.bin
GRUB_CFG=./grub.cfg
GRUB=grub-mkrescue

makeiso:
	cp $(KERNEL) isodir/boot/bos.bin
	cp $(GRUB_CFG) isodir/boot/grub/grub.cfg
	$(GRUB) -o bos.iso isodir

clean:
	rm isodir/boot/bos.bin
	rm isodir/boot/grub/grub.cfg
	rm bos.iso
