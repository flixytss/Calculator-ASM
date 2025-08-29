section .data

_alloc: dq 0

section .bss
global MEMORY
MEMORY: resb 1024

section .text
_start:
    mov rsi, 2
    call malloc
    mov byte [rax], 0x67


    mov eax, 1
    xor ebx, ebx
    int 0x80

malloc:
    inc byte [_alloc]
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
    dec rsi
    lea rax, [MEMORY+rsi]
    add [_alloc], rsi
    ret
