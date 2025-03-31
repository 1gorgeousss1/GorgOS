TARGET = bootloader.bin
SRC = bootloader/bootloader.asm

all: $(TARGET)

$(TARGET): $(SRC)
	nasm -f bin $(SRC) -o $(TARGET)

run: $(TARGET)
	qemu-system-i386 -fda $(TARGET)


clean: 
	rm -f $(TARGET)


