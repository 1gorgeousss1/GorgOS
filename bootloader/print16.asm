print16:
    pusha

start:
    mov al, [bx]
    cmp al, 0
    je done

    mov ah, 0x0E
    int 0x10

    add bx, 1
    jmp start

done:
    popa
    ret

print_new_line:
    pusha

    mov ah, 0x0e
    mov al, 10          ; ascii-esc
    int 0x10
    mov al, 13          ; ascii-esc
    int 0x10

    popa
    ret
