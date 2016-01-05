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

OBJS=$(ASSEMBLY_DEST) $(KERNEL_DEST)

CRTI_OBJ=crti.o
CRTBEGIN_OBJ=$(shell $(CC) $(CFLAGS) -print-file-name=crtbegin.o)
CRTEND_OBJ=$(shell $(CC) $(CFLAGS) -print-file-name=crtend.o)
CRTN_OBJ=crtn.o

OBJ_LINK_LIST:=$(CRTI_OBJ) $(CRTBEGIN_OBJ) $(OBJS) $(CRTEND_OBJ) $(CRTN_OBJ)
INTERNAL_OBJS:=$(CRTI_OBJ) $(OBJS) $(CRTN_OBJ)

bos: bos.bin
	cp $(LINKER_DEST) ../grub/

crti.o:
	$(AS) crti.s -o crti.o

crtn.o:
	$(AS) crtn.s -o crtn.o

boot.o: 
	$(AS) $(ASSEMBLY_SOURCE) -o $(ASSEMBLY_DEST)

kernel.o:
	$(CC) -c $(KERNEL_SOURCE) -o $(KERNEL_DEST) $(CFLAGS)

bos.bin: $(OBJ_LINK_LIST)
	$(CC) -T $(LINKER_SOURCE) -o $(LINKER_DEST) $(LFLAGS) $(OBJ_LINK_LIST) -lgcc

clean:
	rm -f bos.bin $(INTERNAL_OBJS)

.PHONY: bos clean

