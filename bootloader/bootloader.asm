[org 0x7C00]              ; относительно этого адреса 
bits 16                   ; сообщаем NASM в каком режиме будем работать


    mov bp, 0x80000        ; настройка стека
    mov sp, bp

    mov bx, HELLO
    call print16

    call print_new_line

    mov dh, 64
    call load_sectors

    mov bx, SUCCESS
    call print16
    jmp $

%include "bootloader/print16.asm"
%include "bootloader/load_sectors.asm"

HELLO:
    db 'Welcome, my brothers!!!', 0

SUCCESS:
    db 'SUCCESS', 0

times 510 - ($ - $$) db 0
dw 0xAA55
