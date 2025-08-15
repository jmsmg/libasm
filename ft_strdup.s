default rel
global  ft_strdup
extern  ft_strlen
extern  ft_strcpy
extern  malloc

section .text

ft_strdup:
    push    rdi
    call    ft_strlen
    lea     rdi, [rax + 1]
    call    malloc wrt ..plt
    test    rax, rax
    jz      .fail
    mov     rdi, rax
    pop     rsi
    jmp     ft_strcpy

.fail:
    pop     rcx
    xor     eax, eax
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
