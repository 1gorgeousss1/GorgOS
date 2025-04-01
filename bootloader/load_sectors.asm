load_sectors:
    pusha
    push dx

    mov ah, 0x02          ; функция чтения
    mov al, dh            ; количество секторов для чтения

    mov ch, 0x00          ; номер цилиндра
    mov cl, 0x02          ; порядковый номер сектора
    mov dh, 0x00          ; номер головки
    mov dl, 0x0           ; номер диска, 0x80 - первый жесткий диск, 0x0 - floppy диск

    int 0x13              ; загружается по адресу 0x1000 (bx)
    jc disk_error

    pop dx
    cmp al, dh
    jne sectors_error

    popa
    ret


disk_error:
    mov bx, disk_error_msg
    call print16
    jmp $

sectors_error:
    mov bx, sectors_error_msg
    call print16
    jmp $


disk_error_msg db 'Disk read error!', 0
sectors_error_msg db 'Error read sectors!', 0
