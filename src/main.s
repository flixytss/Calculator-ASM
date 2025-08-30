;MALLOC
section .data

_alloc: dd 0

section .bss

MEMORY: resb 1024

section .text
_start:
    mov rsi, 4
    call malloc
    movzx byte [rax], 0x41

    mov rsi, 0x00
    call put

    mov rsi, rax
    mov rdi, 5
    call realloc

    jmp $

    mov eax, 1
    xor ebx, ebx
    int 0x80
realloc:
    ; rsi memory; rdi size;
    push rsi
    mov rsi, rdi
    call malloc
    pop rsi
    xor rbx, rbx
    .loop:
        cmp rbx, rdi
        je .done
        mov rdx, [rsi+rbx]
        mov [rax+rbx], rdx
        inc rbx
        jmp .loop
    .done:
        ret

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
    movzx rdx, byte [_alloc]
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