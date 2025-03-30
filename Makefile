TARGET = bootloader.bin
SRC = bootloader/bootloader.asm

all: $(TARGET)

$(TARGET): $(SRC)
	nasm -f bin $(SRC) -o $(TARGET)

run: $(TARGET)
	qemu-system-x86_64 -drive format=raw,file=$(TARGET)

clean: 
	rm -f $(TARGET)


