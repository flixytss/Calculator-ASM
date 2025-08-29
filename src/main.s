section .data

_alloc: dq 0

section .bss

MEMORY: resb 1024

section .text
_start:
    mov rsi, 4
    call malloc
    mov rsi, 10
    call malloc

    call freeall

    jmp $

    mov eax, 1
    xor ebx, ebx
    int 0x80
copy:
    mov rbx, rsi
    mov rsi, [rbx]
    call put
    ret
malloc:
    .loop:
        cmp rbx, rsi
        je .done
        push rsi
        inc rbx
        mov rsi, rbx
        call put
        pop rsi
        jmp .loop
    .done:
        xor rbx, rbx
        sub rax, rsi
        ret
put:
    mov rdx, [_alloc]
    mov [MEMORY+rdx], rsi
    lea rax, [MEMORY+rdx]
    inc byte [_alloc]
    ret
freeall:
    xor rsi, rsi
    .loop:
        cmp rsi, [_alloc]
        je .done
        mov byte [MEMORY+rsi], 0x00
        inc rsi
        jmp .loop
    .done:
        mov byte [_alloc], 0
        ret