KERNEL=./bos.bin
GRUB_CFG=./grub.cfg
GRUB=grub-mkrescue

makeiso:
	cp $(KERNEL) isodir/boot/bos.bin
	cp $(GRUB_CFG) isodir/boot/grub/grub.cfg
	$(GRUB) -o bos.iso isodir

clean:
	rm -f isodir/boot/bos.bin
	rm -f isodir/boot/grub/grub.cfg
	rm -f bos.iso
