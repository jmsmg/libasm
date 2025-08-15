global ft_strlen

section .text

ft_strlen:
    xor     rax, rax             ; 길이 카운터 = 0

.loop:
    cmp     byte [rdi + rax], 0
    je      .done
    inc     rax
    jmp     .loop

.done:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
