CC = /usr/local/i386elfgcc/bin/i386-elf-gcc
CFLAGS = -g

os-image.bin: bootloader/bootloader.bin kernel.bin
	cat $^ > os-image.bin

kernel.bin: bootloader/entry_kernel.o ${OBJ}
	i386-elf-ld -o $@ -Ttext 0x1000 $^

run: os-image.bin
	qemu-system-i386 -fda os-image.bin

%.o: %.c ${HEADERS}
	${CC} ${CFLAGS} -ffreestanding -c $< -o $@

%.o: %.asm
	nasm $< -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -o $@

clean:
	rm -rf *.bin *.dis *.o os-image.bin *.elf
	rm -rf kernel/*.o boot/*.bin drivers/*.o boot/*.o
