[org 0x7C00]              ; относительно этого адреса 
bits 16                   ; сообщаем NASM в каком режиме будем работать



    mov bx, HELLO
    call print16

    call print_new_line

    mov bx, KERNEL        ; из этого регистра будет браться, в который загрузится ядро
    mov dh, 64
    call load_sectors

    mov bx, SUCCESS
    call print16

    call switch_to_pm


%include "bootloader/print16.asm"
%include "bootloader/load_sectors.asm"
%include "bootloader/switch_to_pm.asm"
%include "bootloader/gdt.asm"

HELLO:
    db 'Welcome, my brothers!!!', 0

SUCCESS:
    db 'SUCCESS', 0

KERNEL equ 0x1000

times 510 - ($ - $$) db 0
dw 0xAA55
