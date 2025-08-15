global ft_strcpy

section .text

ft_strcpy:
    push    rdi

.loop:
    mov     al, [rsi]
    mov     [rdi], al
    inc     rsi
    inc     rdi
    test    al, al
    jnz     .loop

    pop     rax 
    ret

section .note.GNU-stack noalloc noexec nowrite progbits