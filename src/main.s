section .data

smg: db "Hola Mundo", 0

section .text

_start:
    mov rax, 4
    mov ebx, 1
    mov ecx, smg
    mov edx, 10
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80