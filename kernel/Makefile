AS=i686-elf-as
CC=i686-elf-gcc
CFLAGS=-std=gnu99 -ffreestanding -O2 -Wall -Wextra
LFLAGS=-ffreestanding -O2 -nostdlib

ASSEMBLY_SOURCE=boot.s
ASSEMBLY_DEST=boot.o

KERNEL_SOURCE=kernel.c
KERNEL_DEST=kernel.o

LINKER_SOURCE=linker.ld
LINKER_DEST=bos.bin

bos.assemble: 
	$(AS) $(ASSEMBLY_SOURCE) -o $(ASSEMBLY_DEST)

bos.compile: bos.assemble
	$(CC) -c $(KERNEL_SOURCE) -o $(KERNEL_DEST) $(CFLAGS)

bos.link: bos.compile
	$(CC) -T $(LINKER_SOURCE) -o $(LINKER_DEST) $(LFLAGS) $(ASSEMBLY_DEST) $(KERNEL_DEST) -lgcc

bos: bos.link
	cp $(LINKER_DEST) ../grub/

clean:
	rm *.o
	rm *.bin

.PHONY: bos.assemble bos.compile bos.link bos clean

