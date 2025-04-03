# Компилятор и флаги
CC = /usr/local/i386elfgcc/bin/i386-elf-gcc
CFLAGS = -g -ffreestanding -nostdlib -Wall -Wextra
LDFLAGS = -Ttext 0x1000 # Указываем точку входа _start
AS = nasm
ASFLAGS = -f elf

# Список объектных файлов ядра
KERNEL_OBJS = bootloader/entry_kernel.o kernel/kernel.o  # Добавьте все ваши .o файлы

# Итоговый образ ОС
os-image.bin: bootloader/bootloader.bin kernel.bin
	cat $^ > os-image.bin

# Сборка ядра
kernel.bin: ${KERNEL_OBJS}
	i386-elf-ld -o $@ $(LDFLAGS) $^ --oformat binary

# Сборка загрузчика
bootloader/bootloader.bin: bootloader/bootloader.asm
	$(AS) -f bin $< -o $@

# Правила для C-файлов
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Правила для ассемблерных файлов
%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

# Запуск в QEMU
run: os-image.bin
	qemu-system-i386 -drive if=floppy,format=raw,file=os-image.bin

# Очистка
clean:
	rm -rf *.bin *.elf
	rm -rf kernel/*.o bootloader/*.bin bootloader/*.o
