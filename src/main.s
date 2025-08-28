section .data

_alloc: db 0
_zero: db 0x0

section .bss
global MEMORY
MEMORY: resb 1024

section .text
_start:
    mov rsi, 10
    call malloc
    

    mov eax, 1
    xor ebx, ebx
    int 0x80
malloc:
    add [_alloc], rsi
    mov rax, [_alloc]
    mov rdi, 0x01
    add rsi, rdi
    push rsi
    mov [MEMORY+rax], rsi
    mov rdi, 0x08
    add rdi, rsi
    add rax, rsi
    mov [MEMORY+rax], rdi
    pop rsi
    lea rax, [MEMORY+rsi]
    ret
