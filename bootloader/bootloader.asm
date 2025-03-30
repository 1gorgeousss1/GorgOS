[org 0x7c00]              ; относительно этого адреса 
; bits 16                   ; сообщаем NASM в каком режиме будем работать

    mov bx, HELLO
    call print

    call print_new_line

    jmp $

%include "bootloader/print16.asm"

HELLO:
    db 'Welcome, my brothers!!!', 0


times 510 - ($ - $$) db 0
dw 0xAA55
