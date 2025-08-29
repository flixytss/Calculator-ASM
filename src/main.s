section .data

_alloc: dq 0

section .bss
global MEMORY
MEMORY: resb 1024

section .text
_start:
    mov rsi, 0x3
    call put
    mov rsi, rax
    call copy

    jmp $

    mov eax, 1
    xor ebx, ebx
    int 0x80
copy:
    mov rbx, rsi
    mov rsi, [rbx]
    call put
    ret
    
put:
    mov rdx, [_alloc]
    mov [MEMORY+rdx], rsi
    lea rax, [MEMORY+rdx]
    inc byte [_alloc]
    ret