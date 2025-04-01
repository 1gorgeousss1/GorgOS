bits 16
switch_to_pm:

    ; выключаем nmi
    cli
    ; включаем 21-ый бит адресной шины
    in al, 0x92
    or al, 2
    out 0x92, al

    ; загружаем указатель на gdt
    lgdt [gdt_ptr]

    mov eax, cr0
    or ax, 1
    mov cr0, eax

    jmp CODE_SEG:init



bits 32
init:
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    mov ebp, 0x90000
    mov esp, ebp

    call KERNEL
    jmp $
